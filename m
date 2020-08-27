Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC291C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 13:04:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5E6422CBB
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 13:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3j23+xc5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKheZYsk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5E6422CBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qL8xpLQq7Iy5bSZC+CAFpFCsxPLSoMd06wGa4a55uao=; b=3j23+xc5NQQydeNzI8Byv6hhL
	ze1eboxj/g4L3bYxKky++6kQ9BqbROanXTd+v5iCbA6jxiTb27lzOpr2uZpEH/UREjl1CGekrn7/u
	ojuUZjb4qWuGbWN2hM0Zj6BsxZ3RNFpPcVtyGzMAb1Ds+a4F3sV6NwPJecaMtreknDFgfNMlhuHr4
	w+YmBdy34PjER3cfUxiBOjAUkbM2cqjn25ZSG70HpUccyFx+IPJOVGWnnRI1nqAXuVOaoTne6vVia
	nxGQq2Nvo8VtMkAOIUtZyY1jlq0ca4dvh7LziO6ZZWEL4QS6xDFQZvZvJndB3suSZ1Z6j3aWyztm8
	OLZzYOKlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBHZP-0001Oa-5F; Thu, 27 Aug 2020 13:03:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBHZL-0001NP-7B; Thu, 27 Aug 2020 13:03:56 +0000
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC9BD22CB2;
 Thu, 27 Aug 2020 13:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598533434;
 bh=Bi9r01y/oAwP2vlIGYEvJd0db7VUaWRQRZh/kykfMJk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EKheZYsk+i9D/SZWLSwwwgH5/wMI9ndeycv8LzX2TwhOCzJKdQ4c1PxaolOoO5qcj
 bqiw9EnLZFDZHlGopD7a7/SyhwivnFqCm2EUXSHr/E1FZ3zXuuf1bvhXiJmwxGKgZO
 xB9vsq9i2/TByOTvUuFhNH6l3GyNUtViwepcmJtc=
From: Felipe Balbi <balbi@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] usb: mtu3: fix panic in mtu3_gadget_stop()
In-Reply-To: <1598520178-17301-1-git-send-email-macpaul.lin@mediatek.com>
References: <1596185878-24360-1-git-send-email-macpaul.lin@mediatek.com>
 <1598520178-17301-1-git-send-email-macpaul.lin@mediatek.com>
Date: Thu, 27 Aug 2020 16:03:46 +0300
Message-ID: <87pn7ci6kt.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_090355_398863_130C1394 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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
Cc: Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Ainge Hsu <ainge.hsu@mediatek.com>,
 Macpaul Lin <macpaul.lin@gmail.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Content-Type: multipart/mixed; boundary="===============7375232569515615148=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============7375232569515615148==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Macpaul Lin <macpaul.lin@mediatek.com> writes:

> This patch fixes a possible issue when mtu3_gadget_stop()
> already assigned NULL to mtu->gadget_driver during mtu_gadget_disconnect(=
).
>
> [<ffffff9008161974>] notifier_call_chain+0xa4/0x128
> [<ffffff9008161fd4>] __atomic_notifier_call_chain+0x84/0x138
> [<ffffff9008162ec0>] notify_die+0xb0/0x120
> [<ffffff900809e340>] die+0x1f8/0x5d0
> [<ffffff90080d03b4>] __do_kernel_fault+0x19c/0x280
> [<ffffff90080d04dc>] do_bad_area+0x44/0x140
> [<ffffff90080d0f9c>] do_translation_fault+0x4c/0x90
> [<ffffff9008080a78>] do_mem_abort+0xb8/0x258
> [<ffffff90080849d0>] el1_da+0x24/0x3c
> [<ffffff9009bde01c>] mtu3_gadget_disconnect+0xac/0x128
> [<ffffff9009bd576c>] mtu3_irq+0x34c/0xc18
> [<ffffff90082ac03c>] __handle_irq_event_percpu+0x2ac/0xcd0
> [<ffffff90082acae0>] handle_irq_event_percpu+0x80/0x138
> [<ffffff90082acc44>] handle_irq_event+0xac/0x148
> [<ffffff90082b71cc>] handle_fasteoi_irq+0x234/0x568
> [<ffffff90082a8708>] generic_handle_irq+0x48/0x68
> [<ffffff90082a96ac>] __handle_domain_irq+0x264/0x1740
> [<ffffff90080819f4>] gic_handle_irq+0x14c/0x250
> [<ffffff9008084cec>] el1_irq+0xec/0x194
> [<ffffff90085b985c>] dma_pool_alloc+0x6e4/0xae0
> [<ffffff9008d7f890>] cmdq_mbox_pool_alloc_impl+0xb0/0x238
> [<ffffff9008d80904>] cmdq_pkt_alloc_buf+0x2dc/0x7c0
> [<ffffff9008d80f60>] cmdq_pkt_add_cmd_buffer+0x178/0x270
> [<ffffff9008d82320>] cmdq_pkt_perf_begin+0x108/0x148
> [<ffffff9008d824d8>] cmdq_pkt_create+0x178/0x1f0
> [<ffffff9008f96230>] mtk_crtc_config_default_path+0x328/0x7a0
> [<ffffff90090246cc>] mtk_drm_idlemgr_kick+0xa6c/0x1460
> [<ffffff9008f9bbb4>] mtk_drm_crtc_atomic_begin+0x1a4/0x1a68
> [<ffffff9008e8df9c>] drm_atomic_helper_commit_planes+0x154/0x878
> [<ffffff9008f2fb70>] mtk_atomic_complete.isra.16+0xe80/0x19c8
> [<ffffff9008f30910>] mtk_atomic_commit+0x258/0x898
> [<ffffff9008ef142c>] drm_atomic_commit+0xcc/0x108
> [<ffffff9008ef7cf0>] drm_mode_atomic_ioctl+0x1c20/0x2580
> [<ffffff9008ebc768>] drm_ioctl_kernel+0x118/0x1b0
> [<ffffff9008ebcde8>] drm_ioctl+0x5c0/0x920
> [<ffffff900863b030>] do_vfs_ioctl+0x188/0x1820
> [<ffffff900863c754>] SyS_ioctl+0x8c/0xa0
>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Cc: stable@vger.kernel.org

missing a Fixes: line here

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9HrzIRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZO7xAAm9sZr6+KnTpU/DKiIVja1ris7ncWwhNs
bxcz1Idubfaxfe+v/+u66DxuOhBSuJhvUo3jXEZdvvKIP7iEpU6Ei2VuCN3d6Shu
uImPZhqqio4JQVBAGDE5YOdLEQQt9tnJL0fH2MnE6IdaLSPuU9/FFtz6oa8iZrFa
JJqbs6iiJsgQUUJIO59Rh1eNJNAX4oU+aIKYjjU6zefSUIEJ+tGnYfjP14bCIZaN
lB90TrO96W26M65sZq1C16aF8+m6FWEqxB8vJDx9csJT1muiki1Gal4TB2X7+94v
bbJcZsOZQlsYeT9YXOxkxJcavVuByyH28W7HdjLEe8YIs21vSwla7L1YFrt9dNP6
7pzCsvnecuQtGRZACDFn5fPSQ12wLGlw0Tm1ViI6YLtZshfWWFeKYufk6cIHiksD
PILbl4ulERm2+GhEtJX2k9h4EypKjEmzsjdzzi+/CqF22qWphqP9IIwXClQ3ZOU1
RrM0M1eIR4UBW4pPUeOxAX1evZHmMU0kS1MyAYwzzGwwk3foMrtQd4h5jt/G06+/
E6yIjFoMrtUGMxcFQr/fFQwMYG1BJByE5XsS1l8p2JS7CfH3b7CadfA6sGrDCRqF
QVj0EgD7JKgrpwjgAm8pnTkskZAxxSWyFNMiJyWRhKfhCjfv0pmjYIaeJJAXtK3j
nR/RQXhFEv4=
=iB0O
-----END PGP SIGNATURE-----
--=-=-=--


--===============7375232569515615148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7375232569515615148==--

