Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DC0C5DF81
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 16:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbkVuqDqT4/QcJ6UY7w9DzQnwqj+U7UexT9FJ69upSw=; b=Djl2NZyLUEe6o9RM1+QyVfWFan
	WSNIX+CG7IIRurd2IQDtElnqbrvKdP/Y9pTfHg10OJqoldDYFlPaMECzEN6H5EYds4OKTHFf84yel
	F5foNzd0tX0g24qjFsqZ56uG/mOuThMLeL7gKEDJrxZWLOFOj8UNxxGJ2E/vHw9EKMIoiX3bACIzb
	o07KguALbYe29emEj6rZkONOlhYPVec2qM55nVD2NOpfgfR/tGklU89tVugY64L1CoOX5mfAeepNb
	GgxnZWa/e4RjY57zI67O7InpGis/jKYm6gYstOu8sj720OwIrSJ05x+XaZtr/W/LD8SINYiMFJ6sn
	+Eee9nVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5XD-0000000Bspj-3cRg;
	Thu, 20 Aug 2026 16:22:31 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5XA-0000000Bsp7-3byN
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 16:22:30 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c20ce3c118aso264384666b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 09:22:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787242947; cv=none;
        d=google.com; s=arc-20260327;
        b=GfNrNGSOiN2ZAMxx8JifWTm5qe1BjIBMJPji4nTiH/P1N0zSbwsbU7H0GcmvO5wK+j
         EXJSbDO+LVoM+sMOPKRB6D0Jf965hqWoclMP0iTip9uOHmZreNRmllS2Sr7B4uhoUNYj
         7NVS7+HcZvlxdVJICfz3pe1CypBW6okicknuArmMNXVH1wDLGC4yWBKTMW2So5CKXfub
         fR5GiIN4+v+HjUvGy0bqwTVA8ECyYDj6ch9WGkf3Fkj1yJWDoIEvFIUH9izKfyveIABI
         XEWJkVn9NMZoGwxWjJyMHOk1waaud7LqINJmslfJZLPj1Lbsy9M0PZYuV3efXHBF8pCZ
         bjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=kbkVuqDqT4/QcJ6UY7w9DzQnwqj+U7UexT9FJ69upSw=;
        fh=7q9slQwJZ94/e6e481MFJgYPeNForZhGYqL2OGSLeAY=;
        b=UVaaA6YwZQcZ4NaqeRPzWd2CaJ7LalmMiZSN2XCDiPluirZsDSMSODCyca3tWaKel0
         kWZd8fFbiZ4M3qS15fRl4tWTgiuXz5wzOy06hOm7457/A8ElPsbQr50Lp4WeFHM87od6
         7SJU6TVkjFtGnocdJZ74mLqfha/8jfrxlgwRSgKeKA04/Lll+aMmIdJzgE9Qp+JaI81h
         ElhNcIQ9fV4JoGqJFngyeKOrjCeGaDneagsmcS5xCSpmKyvx1Iqm3WzkS7ijpE63w7fZ
         IVwz4Axfey1T3OQw8/B7qhcbCYYUnezGbPF2ETST7r/I6UiXttRQgBawOcSC9XPdyV31
         1GKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787242947; x=1787847747; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbkVuqDqT4/QcJ6UY7w9DzQnwqj+U7UexT9FJ69upSw=;
        b=ATtgShgf3dHF6U+63DIxFIPFtlEgNiGagRnFkRdNlpJLp/qckweexldMz//m7SXu1d
         QxP9x0ZlUCfY8KqwgOyerGqlshrbzCmf0HnrWbVSbVFItqy3hfaOs7gTZHT3k4ckSzis
         Yeor2plz2rY7uqS7I7fJ1b9YXiLYb+zhmjAGP4CxZj124hhl0pCLcL1/iLTHB9HLPMQs
         fcD4seZ0wyPtWbPVg/z/o97n9U62s/0+sy+bPjNQ5tmdp3K02Yu1AhhsIkQqyDsyuSap
         d9cZthO17/nGICR3ozWZhJKxNrvPtb2+i2DwQhZwlDkMwuKLfap0tiEs+xdOjuoO0UXz
         d2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787242947; x=1787847747;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbkVuqDqT4/QcJ6UY7w9DzQnwqj+U7UexT9FJ69upSw=;
        b=mm6rdy5eLW9uN03a2EjZbo81lDxvrgC05Qkfto2x+WwhfTYz2qMvycatjXsKev2DSC
         GVCiuBxiNLlKYPzo59lrAZN3fPwi+bEvsEmsk8/a/ELIEmBQL/4FW63Y0A1iZyDt+6EG
         NFM8+n5MfG0EtZM5GW6mtwf4BsVJmIH3h577zKIxiE/625KkX7/bn2bnoNERXEfv/amF
         IGKQcQtz3Lxko2yIQ3r1tlmGfI8N2Jm7L7FNRpZqGDMyDS577jaOF5rovP/tixKBWPOb
         n9vOT40v0BQmBLyaW9Lc9KAQRWlztTN1k0psKu6E1m0mo3uY4KDwN3x23ErNG3nws0OU
         RZcQ==
X-Gm-Message-State: AOJu0Yzs3iLMgn97FXtJqA2wReq1C88vccWEU5xP4Vy/trBaGoj8hRQW
	XMyXYxqi+JZ2SvTFG7BZSJNMfNN/gZ7RSgVFz4+nIJs0joes2JUvuw3k8z7C7sRqg8Hl4AJGl3F
	W4egGNWRAkgYCNoqXNxVbal6T8O4lPAkAsAt8
X-Gm-Gg: AR+sD11U7NHjT8mBrTkutENOyYBqEAcEBHdbH7zUp/42GCd5omkBrmD7NlNoBaP7GO/
	2Y2ir3gwVutOZ+a4RCAHQsOo/PFNb/Gn5JzrlfnZKbbNuCfDt+Eg9oxffr2qMc2GCD0dlzMFOza
	qmF1+2qSBV+IYz3LCAUlSHUoThopG0xi4lOysokC4VVagf7rjFgXQUqj0Urpxtz4GALZ0gr6VrZ
	wrgmu0oYVF5Q4cjwVpv8wmYgiyHIYea5AMlT+8YCjnAXDHa7mXyCXvR/SpHTTSAnK559g2oOYgs
	slIXRhEZhT3yw+gtHIykhROjdFdadDgc8x/IIifNc54=
X-Received: by 2002:a17:907:d641:b0:c12:8a:7d7b with SMTP id
 a640c23a62f3a-c244d45ad42mr582771466b.1.1787242946891; Thu, 20 Aug 2026
 09:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260820122242.120039-1-l.scorcia@gmail.com> <20260820122242.120039-10-l.scorcia@gmail.com>
In-Reply-To: <20260820122242.120039-10-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 20 Aug 2026 18:22:15 +0200
X-Gm-Features: AcwNN1ULD8tV9VduIxQY5KwSWW2RZWb2wXCRNlNix-EL4J7sLEsFXcZHp9EVcOA
Message-ID: <CAORyz2Lggjwgo8TtWQ8YoJ6JUYPoUOOaiAbYm7XkcbR8mppmsA@mail.gmail.com>
Subject: Re: [PATCH v9 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_092228_937302_382F3C0F 
X-CRM114-Status: UNSURE (   7.92  )
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

> +&pwrap {
> +       pmic: pmic {
> +               compatible = "mediatek,mt6392", "mediatek,mt6323";

Please disregard this patch/series. Sashiko correctly pointed out that
it's not necessary and actually wrong to provide a fallback on
"mediatek,mt6323", which was needed on a previous iteration of the
series but not in the current one.
I will mark the series as archived on patchwork and provide a revised
v10 once completed testing on devices.
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

