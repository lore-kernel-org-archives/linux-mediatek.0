Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F44FE77188
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jan 2025 11:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Date:References:In-Reply-To:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icByOsF7hNZZ337PJRmMU4jt4Kwhpb3YWVmnD8BK//Q=; b=0aBNsM4h3GE2txkE8m36C04vZN
	PgQq5+7UyD8OS67+MBLPvKDFz1W9bUQqHA9MfjRHWsXsXL0CmXlptu5iLFyqvfmItTnS0uLlK7caO
	yqZKyC+YyU4zikZNNIRievM96HpYvE7brt4rxbSq3Mkgm3iveQEDYO96aKnTOgY3mUA1cYy7MuBaM
	9e9OWaAo5WZ6maWxe6t467Wh18O3AZoAiSZfJH93aWc2NHZBG/AcBTw4u+RaKj0nsBA5bZfSJaOFd
	2D/fncx7uhiFSV3kABnCv7ceNfYJbPZqtaKBr62fRrbVfbTTVcw9LSJuW3MSX7N1bVFnUkLSYLHmy
	8eYhJe5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU2Vp-0000000EvpY-1GqO;
	Sat, 04 Jan 2025 11:40:13 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU2Vm-0000000Evox-3Y0k
	for linux-mediatek@lists.infradead.org;
	Sat, 04 Jan 2025 11:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1735990797; x=1736595597; i=frank-w@public-files.de;
	bh=icByOsF7hNZZ337PJRmMU4jt4Kwhpb3YWVmnD8BK//Q=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:In-Reply-To:References:Date:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oci9orCsBP997NsO6Webcy/QtxqLtCu3n+Ffp6T6UlCi73AGINFMwr662IQDRHoC
	 KLIdlbs59GgfiWBYJ8/N6+6gW7NF1Wx2sABrWNaPllIOaRWpwv/syMc2j28DhohG2
	 NPzxNjFna/sujqgZ3VBX1y4mn7jZaibSH45BACuuJRDI9YqO2HdFg8zOwhj4sUjia
	 to5058xv3GAveKMh+pjFQ8huMzsimYGuZ3GXnuFzZAIJqVrGf+cp7c26NfjgFRrzk
	 M2GBeSuGdPV0GUT3Sr81Vu7cMeE8iG7zV08AhgwLoHNyZ210KgyfWvJ6/EJZDiK3U
	 o1JG8ZtGnb1NCLLKkw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [194.15.87.187] ([194.15.87.187]) by
 trinity-msg-rest-gmx-gmx-live-bbc95d94c-9m2wx (via HTTP); Sat, 4 Jan 2025
 11:39:57 +0000
MIME-Version: 1.0
Message-ID: <trinity-0eec3a68-fc9a-4ec6-8c95-1cd58f3bcff8-1735990797237@trinity-msg-rest-gmx-gmx-live-bbc95d94c-9m2wx>
From: Frank Wunderlich <frank-w@public-files.de>
To: frank-w@public-files.de, shayne.chen@mediatek.com
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 ryder.lee@mediatek.com, evelyn.tsai@mediatek.com,
 linux-mediatek@lists.infradead.org, shayne.chen@mediatek.com
Subject: Aw: Aw: [PATCH wireless] wifi: mt76: mt7996: fix invalid interface
 combinations
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <trinity-67c63297-52b5-4d2c-bcdd-1e86936c4b26-1728494589152@3c-app-gmx-bap26>
Importance: normal
References: <20241007135133.5336-1-shayne.chen@mediatek.com>
 <trinity-67c63297-52b5-4d2c-bcdd-1e86936c4b26-1728494589152@3c-app-gmx-bap26>
Date: Sat, 4 Jan 2025 11:39:57 +0000
Sensitivity: Normal
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:6g1zFbGGvW8NaDhbU4zUxc/9aXAyRBjiFU7KoxiifwqVPEXDsU65UuwpojdCJmmV7pPY9
 c/Y2OzgRPCXRjNLJTq8adLOY4ZyBi9rwZ7n5n4kHIpaP507jrKCmfRMHxeCRyASoGZmf1Yog7oj8
 fVu44HpeJq4gIaTTUwbIxqzlNJTumwJT5Bxu09kSKmhLC8k2Gj9f3gQ+YaF+9C2QnGn/Xk1YC8F2
 JAg7W5dJ6Mpbmg4vOfgv6kiakbvWV9UX7gjltnJAx8IOaPkdY6BGhsaZqUtxMdJ72oQRElOd6pz/
 EbJpVQyfGeuNX10Vj5JQXomdsFQBFvZNUKDVJJRvg6gXIv+c5KLOuGmLP8T/XRml2E=
UI-OutboundReport: notjunk:1;M01:P0:HM0e+AwcpAo=;V2FPj4vVb906xKpudUMHhsDAmxg
 XKUMfqwDKM37XSgIo0lC+zES26AGSiY6Hd5YJo8m68Cl133F2Vk8IK3MKO5U0mHHsXY++zHl8
 fgy0cG7oBXFp/dxx9N0ZNj1QDenCWaZzmRUMJJP82a2i/0FbXTltXik2LMZmswReH88Sep+/Q
 4WhC0QC7tL0SpP0YfXNmL0gLU0WGIm10/zpiZVPopbaCA9dqqDogahLl25++fOctX2PxqT/ik
 IGrax0NdXXebnllfBs/QVKhGr1xlgmkHLMrIWtfvjrjhv1hE9RKeOPOemHk26J331iNXaxT6m
 bM3sypsS+SxX+KpflA2qQRfsGG+y9Yb7El+iW9tRxysUJgvt7brn5ySG7oUsz76Zjm5quLLPI
 /6YlU1OGtfC4++vOqeC29iK/2euV0q/Wm89LQBCD0ZBnpeZJNsj364zenmM4VmjNLSK4xvuQY
 x1O36I4lCnaCsF1//1O8FG9nhrfh82030+MrA7L/KrI8k+XwiYM4L9TmtJLeRkRT2COhJowUs
 T98uUnihYioM2gviOsU4kZcthzfbozdpxBYYdt/6BWxKsg1FGt7pRTbOIyM/5wOMmXTaj8vKj
 BNVrPwStWoTmsGB1YojyAr7T6n2kZFb3dlYPCKgOZwRXZt38rK0b2DnAB/UJxsvBwnGkyjQdM
 FX8zXuoHlNbhhnBfk3iDuwiT5doP+l+cI5SrNFNpvgTQE0Cc1f5vOHm7+3oQZrvdJnfLy03Gb
 XODB6soyBkWvJjLB7wRnM2GRd1LjrjCQXJTz9xnbKVh+TiGgIaUfDzPoXZFEEFCowXO0Xr7a6
 vh+Gj5UL1XQH9dKwIx0IjUdkOO9dOPVBif8M+7iRBjqFvcXemdYEZNzlrt5Fa8/8tGeC5UYSb
 ye29bWJmUbo0JtMWVmmsueIG9ZpitzW5g0wc=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_034011_250534_7BDBF346 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

this seems still not merged to next.

can wireless/mtk Maintainer please pick this up?

> Gesendet: Mittwoch, 9. Oktober 2024 um 19:23
> Betreff: Aw: [PATCH wireless] wifi: mt76: mt7996: fix invalid interface =
combinations
>
> Hi Shayne
>
> > Gesendet: Montag, 07. Oktober 2024 um 15:51 Uhr
> > Von: "Shayne Chen" <shayne.chen@mediatek.com>
> > Betreff: [PATCH wireless] wifi: mt76: mt7996: fix invalid interface co=
mbinations
> >
> > Setting beacon_int_min_gcd and NL80211_IFTYPE_ADHOC in the same interf=
ace
> > combination is invalid, which will trigger the following warning trace
> > and get error returned from wiphy_register().
> >
> > [   10.080325] Call trace:
> > [   10.082761]  wiphy_register+0xc4/0x76c [cfg80211]
> > [   10.087465]  ieee80211_register_hw+0x800/0xac4 [mac80211]
> > [   10.092868]  mt76_register_device+0x16c/0x2c0 [mt76]
> > [   10.097829]  mt7996_register_device+0x740/0x844 [mt7996e]
> >
> > Fix this by removing unused adhoc iftype.
> >
> > Fixes: 948f65249868 ("wifi: mt76: mt7996: advertize beacon_int_min_gcd=
")
> > Reported-by: Frank Wunderlich <frank-w@public-files.de>
> > Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
>
> thx for the patch. I can confirm it fixes the issue/trace.

if tested-by is necessary:

Tested-By: Frank Wunderlich <frank-w@public-files.de>

> regards

