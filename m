Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A96CCF2DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2026 08:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7oxDA8ZM54hjX0LF1jWr12XxVGQQXbDbmOXq61AZsk=; b=QrkMPqz/Xh11Pq1t+JIdtekBOC
	GiRxPu4ZeQRwa1iy6KVJ/W/HPA9otV+70eytkX+YHW/25lXgveO8Pdg1kCR9jzemDyj7lPjSt+gEK
	l3Jho++wVlFA8JZ736kjk7nIt/AO07A7ICetx9d0z/jCsyhK/NKTU24bk4e+ORhNC7gdchxyxCJd5
	RNpe1493RIrdGpr2E2+Mo7ukx29bZP5SEYZmpOOP0gN5OvGvRnOFNh6DAFiiExpDH7FnzkZt+nfG2
	5ui0R13uApvf3g3Q4jIAV/nbegfV3jtODvX5hJcVfSg6CeoazYTC1Ey5mFDKNL/4IkwGGwEQQ8zDf
	0XUt74pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIimR-00000006sPu-2jLm;
	Mon, 19 Oct 2026 08:31:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIimP-00000006sP2-1TjN
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Oct 2026 08:31:38 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49d05d51553so12106815e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2026 01:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792398695; x=1793003495; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l7oxDA8ZM54hjX0LF1jWr12XxVGQQXbDbmOXq61AZsk=;
        b=hkM+WOKDTCdgf+HAeuTHlRkpu+UxaNWdAyBRp+IgL+GB7ol3vISyydM2G/3lbtjW+a
         zIQyg2+6T9lvTZnJCY8h0m4157uejwt0pb9YAO6qnbW7W0AJggyUjmqf+mr5Y367sprz
         GSrdB6CvZmV2rYE+tYXF+Xj6nY8YBj8doxcIqXZSwC1YPrK9PijfZ6E71WSYjnet4tak
         MzXIGM3IsqrXc1zRmVj/6wfkATrqdBgwcF/7dk3ms+9vMpYiPnfrMORAvWEGPX71ZI0O
         MoNeGSVpX9SiDuyBEXW0/GyQSISNlnxNT2OACaXX9qzZAkZ8kauu9nEgFvJHgJwmAO4a
         dBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398695; x=1793003495;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7oxDA8ZM54hjX0LF1jWr12XxVGQQXbDbmOXq61AZsk=;
        b=pC4t0KQUw6h5bOsiStRrFyEn94+GhJ2ZiiRKYR3Ocrf+5I0WA3OCC/MhiNImx1P/8i
         g8yO3v5gRbW/OpLyIseKRjlVwIcAk5pZbgbwWfn9y7LhCTWJoVr2mLlRl0tzYtKDyCut
         OSQH0uKWE+2yr2gUqtp3chDzRJJ7//MOGkkUlzU0uJTWCVaerNYJ6g9sdxHXmUWmauuo
         TiSYvL2QTZUcMfw58anVNcwl6HcEgD1KpoYx0IzqvxcIc7OgXYf6Z2vE/Q3Iu5BQoRK9
         mPqBt4YSG5ToAKtj6y4kZip2QzpFj4dZlnjx9iVTI4cFom/hVx43bkooF43z1Uus9iOx
         zaPQ==
X-Gm-Message-State: AFq9FYKrJXqqSTT+SsxXbvn1lnf8Y652aQGopPPvosYa+tZ1wfcK9Bjm
	heWRev0AYEeehA14YRHI9VPZFCox17bBfBD6XIPCX1TQZPiXqc5RaydMM0ktHJbf5uQ=
X-Gm-Gg: AYBFou1lk2qFO+zit6Oa5eMOdSAN0m8AVkvbZcI1UkEYrYbfnBHjw3GSzTDmDwOxe8i
	DPfBlolr3m3Zd/0eIIQ/ja6kOhOWnXrwAOdpqYDcA54UajHS0CcQwwtqMVZty01ARHaD0jlMAr3
	tut4Iz34K7EhLf4+Lr4h+Q8zIyh3sPMO365biSM9pepyEmoGo5g9zmgOnoxxu7Kq8OSFhakqn0p
	rm81uXLeN/IXnLG0R55J58V9V2ZB4vwnSfP1DPPcJ3oU4g5qDABM9QurbfPYBlponpoMlr6Ao3a
	1xk8NWeHOGkArVAdzobcXS/e3xVo4OXXFd/bvHNyloNWTGmHB5Cym0N134NSG4R1SoLJ6aZGneR
	LCCBsSdSXnLDqh9nuK8S/jlFJe3EDvdapO1ULWKomM8+FW2Jqr4eTeBHzMYSPIpVJrO+gl/whJe
	ujdAaxQ6yAkxKzWeeJXwFoxLJNixss+sU+CV4XTAErb5mlnx8N8iAIz19E8BE5DNivq3lCnLNfz
	uRgYYb8/iR5+m/0H4G171Jv3+9AGDGG
X-Received: by 2002:a05:600c:37cf:b0:4a1:df14:ad07 with SMTP id 5b1f17b1804b1-4a1df14b4d3mr115190655e9.18.1792398694579;
        Mon, 19 Oct 2026 01:31:34 -0700 (PDT)
Received: from [192.168.7.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1c10fe9d3sm316410855e9.13.2026.10.19.01.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:31:34 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH PARTIAL-RESEND v12 0/5] Add support MT6316/6363/MT6373
 PMICs regulators and MFD
From: Alexandre Mergnat <amergnat@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
 lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, wenst@chromium.org
In-Reply-To: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
Date: Mon, 19 Oct 2026 10:31:10 +0200
Message-Id: <179239867012.642420.15110854236483587234.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=409; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=PBtDG7IaGArA5oidyV57104ug2/3g9vZYpC1ajDvsoU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBq1dVWFu5n7LST9XjNvuRmDW3m8PImRaa/WwJvF
 aGMwo1WH0WJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCatXVVgAKCRArRkmdfjHU
 RYoYD/9v5gmSdVR1pNcJamGYwCTaV5rT+OL0L7Hy0d0zenqBBKLBoB5ULjy1XzRycl4z3uzaIyh
 HQUxpufXinchYoRParULVTDzEU4bDge3j+RivbJcNFkvXnPCQgkpifnmkNcDXTB9oUboxK1rI7r
 +tAfXnNtM2XECrhINjZemeKSzTK4o8hFFQJpNqZ4vaEGd+p+yQ4OydfroxrsQ4ussOJJPt11pGq
 XYPpjNtd0I0txUKPm4uxzqeKXpecqVNan77gYpf2Zy4bqjyPIJ4J8QL6kPbR5WqdRvNYsOHGDqJ
 dl7xZBqbcEbBuPZcPfrVa/SSbEyzcEhseR1YtAQVTAC6839HIwcR1jpJFaDI9G9Ir3/FpYJQLmE
 aeNNSiYLiXr7xplXwVUPfNl1T2lJVnqdJG3AIkiGgPrgG/ejs1a4kvLbqWOHQj/tmmEwDk4AIfb
 xtYYBpnPtu5B8G7FThL3jY6+qKUYBxCqmMmqQlOJspghF2IILNdA+7mnxsIhLRfzU2Rl6nFTl8z
 Geg76d4ZObp7A2TIzxpiApY+ZYVr1BBhu+N8aEMC2oJlVTeBUzWsCz0zgnTHPk8MSX7lzXsUqAV
 Us+8pkPLCQTVvlh75nO0i+L8I/yvjmltf99bYdYnK2F2Zi6T6c96vwUg8+NuXxvyDa5WIYTa2nc
 0xA7MHt6FvBAylQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_013137_411077_551D3D78 
X-CRM114-Status: UNSURE (   8.21  )
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

Hi Angelo,

I'm working on mainline support for the MT6363 MFD PMIC.

Are you planning to send a new revision addressing the review feedback
on v12? If you don't have time to pick it up again, I'd be happy to
help address the remaining comments and prepare a new revision,
if that works for you.

Thanks for your work on this!

Cheers,
Alexandre

-- 
Alexandre Mergnat <amergnat@baylibre.com>

