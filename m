Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285EFC79FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 04:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=; b=PIkHQXOwmfbAhLccJsvvv+bFnE
	TnU6CrjJqnJhMZta/gkhnWfQ12ZUWFwkf6+R9EhwMthFQLsLh2YPKG8SXvrXdCUSlTBsizMXM6sFE
	76qezkz9okgk64TX997OVW09HSnoqawZFGC80bekN2ko7/WhyVDFtd83JTqhixiRQM/GqiJabkyvO
	QYLn71pFHOwYz/ECMuqg3hIxcmu4GFwgDGYjEgRbzc3NH6sDn+KylAHZ9hBi9puC8KkQscMu//v7v
	kamTbWjRWqR7FCpEQNCPG8FLCM2E5q7TNlTZuUu0eNgJqkM5cgjor1ByFIuaiH+HwpljlrnIpZXnj
	a4xNRYgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WTQ-0000000DN6o-3ecD;
	Thu, 10 Sep 2026 04:33:20 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WTN-0000000DN6J-3kcV
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 04:33:19 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4aeb5so793510a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2026 21:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789014797; cv=none;
        d=google.com; s=arc-20260327;
        b=bx9PVPADeWRYyJHf5vdjPMHe+VHlxRUt8QUbxSum8J5oNJ96GfmeZ0dBoy6SBLPD4P
         Tn3NeKY0QeUzaLcIy3EwaxUitx7dEGGrQVKxRacxWryEjiLea5kkAaMhVlZ3mlp/693R
         Lp/kPIOBFnePUZ1X5VvZy/84Nkx0jTra0JUJ+e0eBp6wwUzspYKXV13cDwWPo6NO/iQT
         S+ZZTSkGr19mODsY7wqN74aIPSPUSLv873pAePEKv9TS17vmFKVXl+tL6eZ747E0cAcX
         HO4WOwAja1B8spDA/isOb/GYX8RmJDqwWEt/Yn/cB0Kql4sVwdTCfxjkZRzKiEgUAeop
         93Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=;
        fh=5QuoO/cDrC8px8YKsFGbbRTzGfBAvdhgLVyRzmVTt1g=;
        b=byAnKa10GkFhBcafY8y+TOlGXx4ZIcBPW9um6a31c01TIBnxZYW9pZs5otoQp6FHLJ
         yMceCUXG4uIgc8KZiBTQTh/1T5IedaHN1x/PSvscPnemYzBIbvX+8OaX8Ra1iwGbBXGf
         BwaPJpMJC9dUQ7+bq3nwnUFLqRo/ygA2JEMLyNXbxk8XAJQiKUIKiTYClplDqH3ZKegR
         gjl6UftWq5S4Njp9RRRBiNbQGuMy/AaWFLB/tiw9f3cDXtd5l7drJIBaV8Lb4m7JM0xW
         AyKVNYm2LsHUoyT5vUWE4yNoYcaMS0IK4oD/MnnwrZnJj/vjqLZZrlyykj3QylQM6K6s
         jaqg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789014797; x=1789619597; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=;
        b=hxwU1VgC8iU8MX1Q1JbyNNH8zel7m/L1lfYtjdHz2Ttrdsoy1cJZ5vfVEY8H7c2y0q
         1mKgbl/4uuVdVMZyf1W3X+kUZNIbOKm3ocvPWgxwPbbwUMqkgOxbw+7ae4UKkGulWDDZ
         0oh96UbELWgovU2fblxUmfesGRGfh79aAMSWZAEqPFYICMTuBLRp3bB6DFGZdbayQMHD
         lqjm+AIKTPpMP2MsjJnbF39/pVayjwGp6DfY1ilXd86cvUAF63SunXZtwxNE65erMXc1
         JDKrEdI7WF8Sa9fSnOJnEzQIbVrOj60KVctk/hip+5rvF6Hthg8DyQ2CSvBFNmzwMqQA
         +74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789014797; x=1789619597;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=;
        b=BNHDuykftZAFKqTSnfwX0MgBe+dlwXisrdLMjZ6IN7915Yuxo3O9r9PKnovmieNOoY
         VHG/S4j0P+uHrP5BMiC1b9en1iTpU5hlOpZWkz3VDLHjNw+duTz6E4M1chxCQgwj/sim
         QFdCDFHz0eZm84DbTxAfN8sP/WqqtT5Zm733C3flRXLVz5YMGtHFwJFoCFOaJCyfYuqz
         IXeM5Se8qdRWhAzPIRHpK7ORuan1VdfHkxZ3uyB7HrewbWfWltv8fiLHdWPl+ti3C//f
         KHpEwD3nw7IvEdkIgMeKbqK+A9/F4UuIkInUdphcjo5byPl++lAw349fSCa2Y9o0JRkT
         SJQQ==
X-Forwarded-Encrypted: i=1; AKwUvBysTJ1hCJFw52HwZlZCwZT7Ox4m/o6rF74qRzDxF3W9yi3oCucO8uiSfauQ1Nqqeip/E67Y6KtX7jOm+o76fg==@lists.infradead.org
X-Gm-Message-State: AFuF++nlhl17pgkj7EI7QV2NSSaPNw8ABMnaCefkrUkuhkvmwrwuJNPw
	5gnlZNw9xOBOubpyMUSUZvK4Od55Zby914nRuhJARktBG+ulNztEf/dE8CvC9kBgVpbhIFp5Dxz
	Y4py4DQLJzp/P7bjEkat3hTedw7rMI+I=
X-Gm-Gg: AYBFou0Ibwxof6G6m3j6Srj+93I6tyzAmAW3ettJKK4+NeDtXdMucQanBLbIF3El8y8
	3dN7hXV1UozjVkfoC485X5cXB2AhSX8RLK5bpqIWv/XcPTv2eGXGfcHVepsllJRoI0NpPdF3Spo
	90jfcgXFwL+TQgaN9weicYzeBhRJbgs5APYnAboYfEFrdjnSLWQj8QG2KsHwMlKVQ/aTxos4GtA
	LjPsylGWaQcbqhtnl8YD7Mnd91j5cf+yLmBij2ladg194XOo1hy6RX34UnTGoO50xXE4mowcwuF
	OF0BD3QhFEUHhtWE4oqj5zBDPh3WPGx3RjywjpSTCcWd+8fPdCMGmkiRCd4QwXaeTB3J9e6AvLY
	xANucdihHFGPWZOZrhz6EuGkEM3lptw7R8wUZngL4s2XB5pxIg59WiPg4heEV4c0/wd8=
X-Received: by 2002:a05:6300:218e:b0:3cc:2552:ddd7 with SMTP id
 adf61e73a8af0-3dacbd6e443mr7502421637.5.1789014796911; Wed, 09 Sep 2026
 21:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260907120310.135693-1-phucduc.bui@gmail.com> <fb39918f-581d-42f4-8afd-4d467902f9e9@collabora.com>
In-Reply-To: <fb39918f-581d-42f4-8afd-4d467902f9e9@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 10 Sep 2026 11:33:05 +0700
X-Gm-Features: AcwNN1Utf0CzSWMalbFPITyh7LOjNeseUmdFJ3DO0v7FQXT2fxbgmZ8RRqPBOlQ
Message-ID: <CAABR9nFqerKXDocMxFfzvvj1-DfyQDvh1z8W81S_Ss4cMok1tA@mail.gmail.com>
Subject: Re: [PATCH 0/7] ASoC: mediatek: mt8188: Improve error handling
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Kees Cook <kees@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Trevor Wu <trevor.wu@mediatek.com>, 
	Douglas Anderson <dianders@chromium.org>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_213317_941587_A63965CD 
X-CRM114-Status: UNSURE (   6.11  )
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

Hi Cezary, AngeloGioacchino

Thanks to both of you for reviewing the series.

Best regards,
Phuc

