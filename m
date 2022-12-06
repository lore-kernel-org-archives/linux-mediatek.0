Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2DBC352A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ais45k9vzwCVRwJ6whVGyw5sNpBkvpT+u93PldECuY=; b=rZBsNNRz+LQQkcakUtknuXl3w9
	C34xkl7LxahIROAJBZx9CN0iknjYzOwxkEOWYAbwnwFIw/BwPfubRqzOFRKpPrkgm2P61hFZp91J/
	9qKjE/+qS6EnwXXC37CsytmKwvyaZtDsQspA/09mZDWVtBLMmZj6a1AeokTW1IT69SQUH5pOySWjf
	0gMokJQ4SIT77eMH4EYUzeeNMcOuo7e8TZ/YOXppMPS+G6dkr9j0nWWaUHi1Ol0QidCym9ucOQW19
	594s7J+ZLbqBXvKl7VNFBjHQ4lDlvmLHHlfBd1RyHxymNCk830+7aDBDAEU/xcgcFbck/kHigeT8E
	Y6YrDHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2alO-00EkMP-HT; Tue, 06 Dec 2022 16:25:46 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2alC-00Ek2g-Ed
	for linux-mediatek@lists.infradead.org; Tue, 06 Dec 2022 16:25:36 +0000
Received: by mail-oi1-x236.google.com with SMTP id v82so17498710oib.4
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Dec 2022 08:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ais45k9vzwCVRwJ6whVGyw5sNpBkvpT+u93PldECuY=;
        b=SJXK9Njs3/WtQdYO1n5tuMWFnm8eLIT/BZjadd4iLnQyhAXZ8ONXFwPHzYKYFKmvRY
         RUbmsPRvmSN+4oRKBXgX6i4ctkwgVYGNtMm2wdZFidfCSaQ/DQ5AEL6FMxUl0f7Vqi/N
         T0dFcibaJyb7eo5g6dZzXHexJ1NL2vz4ACpEiBj9q+fnBYHC2WM/yLNoY640QEfGORVL
         q3dXAZiHthjklcd02ga4DtsYdCLhAJK+YRTSkfjhD91SGLZT+gmG1wBYXQfyNTybrdWy
         1ej3vsNkXbAOc2pSxX2XFUQEI92czeXwYRrMKtznQZsR9SW0y3QbuZ+2/3P50aDtpYBQ
         0zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ais45k9vzwCVRwJ6whVGyw5sNpBkvpT+u93PldECuY=;
        b=suJXiGrofRE6mWtOQJ/izBQnwR+NF/1hV01M2HqFUTVDHeXQoE9L/r4ppPJ9soM8qc
         MDVj7vLNx+l6fVyRRfLfRYCR3ZAMedvPPHxhpNWHHUibbJdFZxbE7wkfCIqMFK3PfoHz
         /nuc+cGSd0uCis0gBa/YQXpU2iEBTqvMlpIv5qO4SX1E32xZqLg7803lOcZ6b0F6/lsQ
         DgAF8Xxg0U91Y9dRLkITdbnnhA83kjCk0IDg+ib8vjAhKF8g96tkpNpTF5CgGucgTC54
         NuR1g3EFmvLVUZFWssGG69g5FAjRNFjZjHPbTV3Z9JA8qZM9+R7BWQZ4vWCnrrswoopV
         07+w==
X-Gm-Message-State: ANoB5plkYvZUnGJ/qp4w04A/mb5BMay8C/1GECSO7e5Q8E5OCsrcEsB2
	lOfp6WEgHYf1YZDdV+EUkDX29mSwMbI2Oh+g/h9ljQ==
X-Google-Smtp-Source: AA0mqf7slrigjIb2YU0eOuwcUhtuWW55HhFXBRbOprBZ/PpE0rScnzOSK1B/21a3d6JGXEaZoNeytI+ZqJu+h+XBOmM=
X-Received: by 2002:aca:de45:0:b0:354:58db:8639 with SMTP id
 v66-20020acade45000000b0035458db8639mr32339713oig.152.1670343932030; Tue, 06
 Dec 2022 08:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20221129023401.278780-1-bero@baylibre.com> <CACRpkda75U=b50rK=WecNvaEoTdN2UzGyEwfPRaO6jG9FGyWhw@mail.gmail.com>
In-Reply-To: <CACRpkda75U=b50rK=WecNvaEoTdN2UzGyEwfPRaO6jG9FGyWhw@mail.gmail.com>
From: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Date: Tue, 6 Dec 2022 17:25:21 +0100
Message-ID: <CAP2ifjN-czBPKsm6o9U0Zx3dgau6bydFSrZmtwNJecSQu9VMzg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Remove the pins-are-numbered DT property
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, krzysztof.kozlowski@linaro.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	khilman@baylibre.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_082534_696986_889314CB 
X-CRM114-Status: GOOD (  13.18  )
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

On Sat, Dec 3, 2022 at 10:22 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Bero,
>
> long time no see!

Hi Linus,
indeed, I've been doing mostly userland stuff lately, and my latest
kernel patch was x86 (got to keep all of my hardware working ;) ). Now
that I've changed jobs, I'm expecting to be more active on the kernel
side (though still doing a lot of userland).

> > This patchset removes all uses of pins-are-numbered and marks the
> > property as deprecated.
>
> I don't remember any more why this property was introduced, but
> I am happy to see it go.

I couldn't find why it was introduced either (and git blame wasn't
much help). I'm assuming there was some other mode in vendor trees
that never made it into mainline (but the flag for switching between
the modes did).

> I applied patches 1-4 to the pin control tree for v6.2,
> please funnel the rest through mediatek/stm32 and
> SoC trees!

Thanks! Remaining patches reposted and currently waiting.

ttyl
bero

