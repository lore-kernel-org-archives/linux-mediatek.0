Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59992C388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 09:24:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3C2620829
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 09:24:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qb/wim0k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWF6aOhC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3C2620829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IojIZPyUHntic/MIRuP/4o6HtzNHe2atL2PSk7aNnls=; b=qb/wim0kPc74gGEEeJbWV7WLK
	t9HXJ0wUa7J+xTmRLbrZPHaEtduzhgly0huPXWt06QIq5rx3XpwlOgb8PLd1eGsPwjSGQSu6ulPtn
	G9LJ6n3XKv5CVoKKV1N7NUQEA2HMRUb4D/MC9q+39OJ5UEuo/l2PGmuqbMy13t1k6fcO2y8XTHGwk
	wLSCg9+BWxtW5j9xbqaB08/VgGTIgGtka/yI1Ev+bqyIsI01EEbPXEhfJPjdurz4ZDWURi5gP7mQY
	iHqKPRShy0iNQvFNvmO9OTrCsfQRIQOJB5epi4E3ma4099BuF5HmSUU5SVuDgba5L+iViAbwd7vFS
	HCi4fRehw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXLD2-0001Fo-BQ; Tue, 27 Oct 2020 09:24:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXLCw-0001EH-TN; Tue, 27 Oct 2020 09:23:59 +0000
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 57E2A20829;
 Tue, 27 Oct 2020 09:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603790638;
 bh=k0q1UXQyIMVNWtmVhow0jpMDJ0XmJolwwLg8XgByQUg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UWF6aOhC4q0nsNt2300n7nUokiHRXjqrNCtWimEBvdk0KNDuCgoBjaOxMVuIC4plq
 8JeKxkI/G1EwQKZnPg6XKCDPDiunZ5JpcfK8EuHs+Kv7TYYdqtJsaYjSidnhC/KmzA
 Z3vOQRDLZojGT4Vbr1wWnXwS9Vi2CNnzZzXkfMrw=
From: Felipe Balbi <balbi@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] usb: gadget: configfs: Fix use-after-free issue with
 udc_name
In-Reply-To: <1595040303-23046-1-git-send-email-macpaul.lin@mediatek.com>
References: <1594881666-8843-1-git-send-email-macpaul.lin@mediatek.com>
 <1595040303-23046-1-git-send-email-macpaul.lin@mediatek.com>
Date: Tue, 27 Oct 2020 11:23:49 +0200
Message-ID: <87eelkc996.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_052359_131454_3569A4F1 
X-CRM114-Status: GOOD (  12.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: stable@vger.kernel.org, Macpaul Lin <macpaul.lin@gmail.com>,
 Eddie Hung <eddie.hung@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Content-Type: multipart/mixed; boundary="===============0673861011766726199=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============0673861011766726199==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Macpaul Lin <macpaul.lin@mediatek.com> writes:
> From: Eddie Hung <eddie.hung@mediatek.com>
>
> There is a use-after-free issue, if access udc_name
> in function gadget_dev_desc_UDC_store after another context
> free udc_name in function unregister_gadget.
>
> Context 1:
> gadget_dev_desc_UDC_store()->unregister_gadget()->
> free udc_name->set udc_name to NULL
>
> Context 2:
> gadget_dev_desc_UDC_show()-> access udc_name
>
> Call trace:
> dump_backtrace+0x0/0x340
> show_stack+0x14/0x1c
> dump_stack+0xe4/0x134
> print_address_description+0x78/0x478
> __kasan_report+0x270/0x2ec
> kasan_report+0x10/0x18
> __asan_report_load1_noabort+0x18/0x20
> string+0xf4/0x138
> vsnprintf+0x428/0x14d0
> sprintf+0xe4/0x12c
> gadget_dev_desc_UDC_show+0x54/0x64
> configfs_read_file+0x210/0x3a0
> __vfs_read+0xf0/0x49c
> vfs_read+0x130/0x2b4
> SyS_read+0x114/0x208
> el0_svc_naked+0x34/0x38
>
> Add mutex_lock to protect this kind of scenario.
>
> Signed-off-by: Eddie Hung <eddie.hung@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Reviewed-by: Peter Chen <peter.chen@nxp.com>
> Cc: stable@vger.kernel.org

patch doesn't apply:

$ patch -p1 --dry-run
/usr/bin/patch: **** Only garbage was found in the patch input.

Please resend using git send-email and make sure your smtp server sends
it as plain text, not base64.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+X5yURHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZtZg//coyB3wE6OkS6Hlv+h19vVYx+t2brKcxC
g5bumXnlkQ9Alqu77kfPmqXkdtGtTTCIF/hM3WsrvfnHUaewkm2XpFpLfsL4grDQ
cI6VO1basL0cPUDsYYkVcujkTNNpQfAkQ1dcaUn7+Q7OM0uYMDI164AKENynlF+e
pJKHzeo5WJY+FETSac0fqwDoDBuPucHcx+dPjZH4QYCIyEmmCinzrp4CISOpjXCv
mu2n9Ix8CfuFbocuXtqHRZq/t7ZlmhPo9y2+hX1+F33oBRLx4L37/GdicJXWp+Rd
DeZCO5klDOnXheRXK/pyIPOMWrGCar2jyjw1EdqPvW34aabTb2Ms7NuH0u2LaOxu
AGUfuFXML/iWAnBuU1S/Gkjn7+hnZJiLJIV6EM380frH/dz7QXYUdjAlMnCp9qCY
grjypjGIW87GmF8IQS3G2Ip/Ique0rRt03ioUlG/4zq+OKiRaVXCFCvxOyARELmu
r/AlOo+fugXhAaJqcjIS2lYc0j6qp0NV27LVQDDFJI+dJzTXLbENIrxGacn/M0ll
JQnEA0iDmDWXQU1Dv+Lki4ezHg7NWNQSNDBqY/LjdymwtYQd8XcjKo/11Dlq4cpJ
TT72bdl7Rqg/Qm4JB/KWryxSdJlYzK1iLxZLsfuUD5w3I8AO5L+QRurTAhtZ2FT8
fVqBmJhM+/w=
=y0xX
-----END PGP SIGNATURE-----
--=-=-=--


--===============0673861011766726199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0673861011766726199==--

