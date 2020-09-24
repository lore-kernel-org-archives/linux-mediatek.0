Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939E8C4346E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 07:21:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1375820936
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 07:21:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VD09o5Hk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnUbVLur"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1375820936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=50qJFzBHOpvHDlEHO35tjpBEVxkd5/m5HBvXGxDG+k4=; b=VD09o5HklMIWsozMtc2TxI46i
	HxsOhlE7bc3cRDFfMPqkl6N3XcjxKKyv/D2Z/JeVu/y8hc0F+yfgw3n+2DCGCpk7fgy36DxhyB/rV
	F9i1LgroZpd2OURQvjAfP7g+wCIjxBBK1/kW3hZHYYYUUQH9+1kL0Fy3L1pmdr4KTeL5Yz1k63AyE
	00uiBTslg2Im6pnGjk4ZFn7fyob+zKbebKLAh6srepVgCoCz3Do7kJ3A8xWCmyfVAIBWH3pVzPbki
	BFMUVobp2Oh0m9ZXDDOom0GR8OlDtg4/+5OdEJHoEFbvSZQnIYj2XsJDCvhbnz/aVh3U7H9jBpwXF
	NK8uA1WfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLLYm-0004fy-JP; Thu, 24 Sep 2020 07:20:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLLYi-0004eq-A8; Thu, 24 Sep 2020 07:20:53 +0000
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A396B206B8;
 Thu, 24 Sep 2020 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600932051;
 bh=a3boahYY+bS1/3ZRRZ5pIrziFhmmowCQ1igHJkDY6jM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qnUbVLurpWTE/wcG8DFPoLzFnY/KFPdHboliqZc/auY6HYI7b4adpAZ2famHmdYCz
 omvI1Ezysxt/NpM9Ea0zslAtXTU2qCjEURUYX7TVwp+OUUfhlVwtjlWGAXuBxFn3nm
 cRSxliZ6JoyUcIIA1ytGUvCYrVpSyiJwcWt3jPPI=
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 1/7] usb: mtu3: convert to
 devm_platform_ioremap_resource_byname
In-Reply-To: <1600400313.20602.4.camel@mhfsdcap03>
References: <1595404275-8449-1-git-send-email-chunfeng.yun@mediatek.com>
 <87d02y1190.fsf@kernel.org> <1600400313.20602.4.camel@mhfsdcap03>
Date: Thu, 24 Sep 2020 10:20:43 +0300
Message-ID: <87tuvnej3o.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_032052_469286_355C0A7F 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5858984261195367754=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============5858984261195367754==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> Hi Felip,
>
>
> On Mon, 2020-09-07 at 10:42 +0300, Felipe Balbi wrote:
>> Hi,
>>=20
>> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
>> > Use devm_platform_ioremap_resource_byname() to simplify code
>> >
>> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>=20
>> why is it so that your patches always come base64 encoded? They look
>> fine on the email client, but when I try to pipe the message to git am
>> it always gives me a lot of trouble and I have to manually decode the
>> body of your messages and recombine with the patch.
>>=20
>> Can you try to send your patches as actual plain text without encoding
>> the body with base64?
> Missed the email.
>
> Sorry for inconvenience!
> Is only the commit message base64 encoded, or includes the codes?

The entire thing :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9sSMsRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZcxw/+ONb5c+++HB8zlI9JR9AsnkscALZgHSm8
OYOTF0Y9vLiuHbjLuSOOPdWdJyDlMoo+CYrHMV7jHsg6ojWjFGqIeZ7SOZqqLa2C
7Geg5kbbspYrR+ipwPvzCqU8Gnz9glIJJWW3tLA2Dw0hMdqYfJklqUM5i5j+/Fnc
zfUj60YtAWBlzAUC7shEXinexGFF2HiqduCc+qZTYO4sU0iEDT2RxS8TY1u0Tg8N
6zj2QOoB5yGhPwAz9QlQvfj0R5RG6SB+C5VjUJsl+fPquWggz8Zg0fdJ9DZTdmaH
mr4YgOWvJ9SDwI6apEaUd7z8CJ9gCX4ODQ4zM7DPTdGhhEgEL2+F7+brKiGxllEe
YVkScEl2xjqZ+AkAtp064WXsyO9aLncgRvlDl8Le9Md/I9q9XNaC+qgNSZIGYfqJ
wCqEldL2sBdtUMIJnOrMeXHut+Bdenn+/mWLKld8+Qq7g+D+0f9cH675iwwVztHv
riJnFJqzzqwFaHhTfCtzPyTp0l/XBR/0biUpW8o8l+6fGszG857Emfp+NCiQaRLb
/rGOMR5WuWRlJSmbrsDHxl1YUbqg6EcC/63GPJWReHdkagiZzIvUKAIguhPgLXiY
vGl5ebDhHbhFLko/gKgBBCMuZVsxT43FmPZ2ymoOldDG7YP6mmw4fP5DKIHFFZln
DcXZSvCWtAI=
=t7ts
-----END PGP SIGNATURE-----
--=-=-=--


--===============5858984261195367754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5858984261195367754==--

