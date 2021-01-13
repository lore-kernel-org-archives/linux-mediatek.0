Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86BAC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:44:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89D1023359
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89D1023359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ms/w//OIX3GzcQxEssTQ0oFxDpn7KwvIt+WKV1mkol4=; b=GYi6Ti9oG+um8L0394iQT52HN
	cGrs+H+R1gA/x3jaKSgLdfvX+uKZFkuzY1vAjSWEXl4Zb7l9AcjL/cp54j4OyaXk9ZP1vX8ZPSiYL
	qMw6uuqFCHkWSwm7X+Nl9XAZsh9i2DoS1tV4AdTWdznhp4BfK3AxpatHFB6/nIl+4TxDYKvFj8xRg
	CR11FdxrgjNhGB6GvmJQ3xHqwGKCayOQx/gt7BBmSWjr3SeirkWYefHoS+cqbSOARTl5tV86k1+kJ
	ZvOPs0UWKaj1SjplGknsmxUs8HnGCI8sxcu4uDj+NqHsdI3VcWdsFS22ceDCW3fWZIAnL27+L+wQt
	7R5KUArcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzblc-0004LQ-SU; Wed, 13 Jan 2021 08:44:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzblW-0004Iy-Kr; Wed, 13 Jan 2021 08:44:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E7EB23340;
 Wed, 13 Jan 2021 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610527469;
 bh=IVVjQvmFYaDeWKCjGKkm010SywgHjiWycrGVB5N43Hs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GeXLCWPg+Jk0wZyWjZcM0F5D6Nb8js8LncWjSPOb2SQjH9wmaelXoP6pUfANW4Zfe
 mFenLli+pngIvuG72L/tW+/9I/3H1zEe6YZQXdU3wusD9gZ7Pk/FpLDDvf5GTA2Qxy
 zLzMSceLzKMIgKeDcJaSBWu7uCia+dXR6M+ZugJ+7qNoXUfDzth57/3VE9OeJo3Ah3
 ULER4mt/TpQXpJ1EsLB1M1IfmZEwttTG+mhl2XLtxUuIeFUV+/NvWQeJ2Od2+IPNuh
 G6TFiYqk3JoNX1Puz9ev2mEauZ+nopexAFZBv+bGjeshkArUAbe5OhlmkLk1vbz/yS
 4fl/CNnhE9u7A==
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH RESEND v4 07/11] usb: gadget: bdc: avoid precedence issues
In-Reply-To: <1610505748-30616-7-git-send-email-chunfeng.yun@mediatek.com>
References: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1610505748-30616-7-git-send-email-chunfeng.yun@mediatek.com>
Date: Wed, 13 Jan 2021 10:44:21 +0200
Message-ID: <878s8x4462.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_034430_783885_75FCFD01 
X-CRM114-Status: UNSURE (   5.69  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4214059730517815223=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============4214059730517815223==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> Add () around macro argument to avoid precedence issues
>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/+suURHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZbEg//fNGDEuEhmNpa3TsrC7fU/9ozE5RfBfRv
4cvQRqRVQSOIJXcAGYgK89xv59Zq5yOWXvp9D2lqcC4Ayrj/07a0FZLKNt2n2w63
mVUN40Cku2ui2pIpvsZxKRo9OYkgqavTTvQ8WJJBVTWTStO7O4fqBTLVYjgspmS2
Grvq/N3rm+z0Lp2czH7xNYwwCaSsZUSAjZq0DyNmaPPYpTqX1aT1N+esMd5fgB6p
YtDy2BhrQyzOVjB3wk7b4BFaAYjjlpGwGjYpggf0bcChtHcXJbv3Pt4sWKabPHJn
uYF13g1crjR3Kxhprm7L3Yo3J0g3RzbGtZtt6h0M2D3dhRKXuTQNVZ/P/vTiwdb8
4UyGW8E5LAkKj/M6a2agj+rtDjOUnMrbotAX6+p3YhJknmI0EXfPW136Zuhj0kaw
KWUOJTRA1ElLZMHIqmVfO2Uiv1o6BmzQ8i894iQA4iVQUPRuZNBC8cqLWqg2Qo1q
bKOeuHZKtDZat3k2QkvIoAn9kkCmKTsrZDf/QeII9FgTf2GK6bUHWfceseO8FKfN
Iw4O3muEzXDaSQBHPJFNV6uKOBoz3/DfOnPG57NDlEDJy0hysO5x8Dk0re3XfYM/
R3XH7IitMer/A+FwbPnbOLqfPyHmezyiw/utBjEGFfhl9mioN31eX2uM8l9e+g+K
Pjn7ZcchyNQ=
=dzQZ
-----END PGP SIGNATURE-----
--=-=-=--


--===============4214059730517815223==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4214059730517815223==--

