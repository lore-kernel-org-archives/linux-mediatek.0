Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267CEC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Dec 2022 10:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dPJPdW0OjHtfYeHPxJDQbeHGuRhUkb3dvgqzN3cJ06I=; b=CcchwUSaDtL4SwAO//7bM2ukua
	LUyYBhJhTDI5JuSiNVpmZ3d8hLNN8d7YZJsvngao5w0MdBZHX19NohKgtS005ifCTFmbH2Xuz0CvG
	5GCLeX3mpKSVaJQlFrhqO4cY3TmCXupgOjh4E1dzQ7X+xOGBcNzqoopeVaJVVrCNuQpQpwigEoP9f
	mQUWuRuW+fWaXaCaw2q/ot02YXyTxbdnB0U9z6BBoxbVEebmjmYDohOGa6DnU6yV6soZ0ILnx7ocU
	IVfehKJ8T8fYaq3UEvok8R01zdDeiudNBX56TXUwkQI4qSfIpWODprQukWtzB2GlhyWRGR4YslV32
	cTQGm38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6UTa-007v5h-Dj; Sat, 17 Dec 2022 10:31:30 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6UTW-007v3k-IQ
	for linux-mediatek@lists.infradead.org; Sat, 17 Dec 2022 10:31:28 +0000
Received: by mail-ed1-x52e.google.com with SMTP id e13so6809593edj.7
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Dec 2022 02:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dPJPdW0OjHtfYeHPxJDQbeHGuRhUkb3dvgqzN3cJ06I=;
        b=cM5xXV6w10qjn9pJy5L2EEeViv9nLP/9NyvIe4WrcU+QGFAqcEnfHNtCUwwMLa6dBN
         4bCY5+W+OwziY0Zu5h7Bq7OShk/YRKnyzmN4posBQB95q+UY4Dfoe5dR7r8UNxbmdOCr
         jtTZ7WOaVirvISAz8MjekbJVdGT7Fa4PdX4FgHXGw0nB9+rQ+iE48Li7JzNSKKLx1MWS
         PJBN1Io69R9ivNu+JWkuC5aZyR/RNyFeECLdleahY+ObAakHV09J1x9mnKGb9yVZI3z+
         GS40rN56el15ojrqq0motm0ch48BRKhmh4YeANX6RlEikLBoJ20uB+DflCqxJ/lFppcH
         tClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dPJPdW0OjHtfYeHPxJDQbeHGuRhUkb3dvgqzN3cJ06I=;
        b=f1B/fj4UiVuQ4aaxQMDpH1lWxixSm25rHuedCGrkYRqhfkgbaWCNzST4OuUqn17gm5
         TzKnjqIP757EFoS1skaIKjHc80CqMmseeEBKXNtTG73X2swZayzpMD3N79NBlqidmvLQ
         T42Hsf1B1phJot7EL2GDCjwdO/Qvw+ysvIO52BrUo+K0nu6SPN1pSMn7rrEh0AgoecjH
         7nIaDgDpxlyYrH37+0qt6OGprDi6MX8nGQXf26bQPlUSAhvfCZKTZt9i+en0wpuhj69b
         mtZ0VsyHnKifQE0EYWyM9Wi/cAZR8N5ebb+yRVUowVewG2BVInVVV0JPnpaJhDzIHuaZ
         Or8g==
X-Gm-Message-State: ANoB5pntfpG+9qyekTbeTH0UufIGfryHcsoAKXyzVyWZ9JpZK93eulFS
	g+JI+4c/JSaHEPMoFTaVrMYJvplg/sKDkfVxyMSXQw9pnw==
X-Google-Smtp-Source: AA0mqf6iN1ExamtqACFEgpdrfZQcbpCGgbMSxwn3PcnMlG49EK+GFyloTZEFrI6rUzdfKAPXnPod5AlTyO353T3aJpk=
X-Received: by 2002:a05:6402:3810:b0:467:42a9:3568 with SMTP id
 es16-20020a056402381000b0046742a93568mr85468826edb.70.1671273084113; Sat, 17
 Dec 2022 02:31:24 -0800 (PST)
MIME-Version: 1.0
From: Vishal Rao <vishalrao@gmail.com>
Date: Sat, 17 Dec 2022 16:01:12 +0530
Message-ID: <CAMWtyy0kKVsEwz3jQZCMhz4An=E9cinN___JO4+cohArgAmxvQ@mail.gmail.com>
Subject: MediaTek MT7922 (AMD RZ616) Wifi 6E 6ghz not working
To: linux-mediatek@lists.infradead.org
Cc: Vishal Rao <vishalrao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221217_023126_659387_D7D64426 
X-CRM114-Status: UNSURE (   4.87  )
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

Hello!

Please reply-all (to CC me in replies as I am not subscribed to the
mailing list) for any followups where I can provide further
information.

Using Ubuntu 22.04 LTS based distro elementary OS 7 with the latest
available Ubuntu mainline kernel 6.1 RC5 build the wifi does not
connect to the 6GHZ band (Wifi 6E) and it only even shows the 6ghz
SSID name *after* I have connected to the 5ghz wifi band.

This is on a new ASUS ZenBook laptop model UM5302TA with the AMD Ryzen
6800U CPU platform which includes the AMD-Mediatek co-developed RZ616
wifi chip I believe.

Pastebin of lspci -vvnn output: https://pastebin.ubuntu.com/p/QwM58ZkptG

Let me know what further information I should provide - happy to do so!

Regards,
Vishal Rao

