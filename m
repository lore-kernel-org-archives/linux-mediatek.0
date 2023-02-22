Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D160DC61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 08:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Y/laJfFqV4xwHyPJ7m5mnZnkPz7sXnRa7yaLqyRbq4=; b=LP8E1f5dqCXwiCRgDGU6r6/orG
	TuqiGplwg54s9AG68aJupNA6S3fESTjdIKUVdDoczA5cDAqPAybVR0BtoF4DK8Uj4YTlGqvM4J8JM
	XNBcfzBqxZlwYjpM/oHsbo9eZxYOMyzOFw/M1XpKG5g+iKK534ZTrxRC2VYXjriOgYk+pyQT1kZRF
	vXztPMl5cWdB6H1P5ZM4rEVEMAfE8vfpdqz3vQ4hY0UEFpAK2UQGXYB2GiQqwcv6AfTGnMf5aCQ/l
	lyQia0Mhrfvnug299aEGsfowB1zLG+o5dKAAWFwiE3OtOeldjopg9C7m4D4DvTrlcirlqMHXNN7lX
	d1Hj30Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUk4L-00B9l9-Cz; Wed, 22 Feb 2023 08:01:41 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUk4I-00B9im-Qb
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 08:01:40 +0000
Received: by mail-vs1-xe34.google.com with SMTP id u14so7209632vsp.8
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Feb 2023 00:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y/laJfFqV4xwHyPJ7m5mnZnkPz7sXnRa7yaLqyRbq4=;
        b=fwgJZ1kd/b7yZ8TdPMq+tKUzKjEZD5tLpT9fCYC0eKvSX7BY8L4D6l5i5Fs5mQ0VhA
         s1lH2IXxMhWLSNQcMkwL4NsJ6NPlpWG1Hs8qbltFRcnuRTTjJ9K1F6Aq28JktV0upaTi
         lDlbusLsU4bSpWk9IP9DxyyIZVinrYwz8sqm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Y/laJfFqV4xwHyPJ7m5mnZnkPz7sXnRa7yaLqyRbq4=;
        b=krSVkOhVfO9pxG/XDMgUkWDbBZbqfJv8krOvsBVd934rguI0WqUYeHcesWHXlUTVVW
         VSqKk+cQrEf54V6Orbf8z4JHT9HMVQ3Pb3cEEQ7f7A7PQ4zKnNd3MTQwpbi+mwFjW45q
         BIMTdSLe1Y3frdqodv8n2UocgyMzemm7eIb+fWWra3EnB6jdmqBPEI6tPdjVYXMB543u
         VditnkU4WJx6+d2r5O1IBIHJyrTenSKAwt06Dwsx1MMVJA5E461x9oMSNWcnQl1E2V4Y
         q46Mm/8Mf9BI2tsZRh5t2iYEWUQRvfv6kLZLuWy0nMl2uSST3KtcD+zIqDciqHQWOZpl
         x8HA==
X-Gm-Message-State: AO0yUKWEmeSbHVju0o4IEFutkDKvV4uuI3lwxZj4TAOpHdvjZ6Q5jSV7
	cgYkybpptPNlfPHrLKHYdpUjmjDrkZO2ZcSdivh2Wg==
X-Google-Smtp-Source: AK7set8jBcPu1FfniwnfmSpRHGWbhReDFVjElASgEIaz7mr0mpSwwLePzizwdVl4B4a62CrhB/XmVCgC0WHUB1uKmLg=
X-Received: by 2002:a05:6102:570b:b0:3fc:58d:f90f with SMTP id
 dg11-20020a056102570b00b003fc058df90fmr1556195vsb.60.1677052897191; Wed, 22
 Feb 2023 00:01:37 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com> <20230221153740.1620529-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 16:01:26 +0800
Message-ID: <CAGXv+5GKTdGoX61OBb84VeH3nKH2DhN=6h9KEyMuKa2phgcUpw@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8195 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_000138_896627_79957F1F 
X-CRM114-Status: UNSURE (   9.12  )
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

On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The MediaTek MT8195 SoC has a Mali G57 MC5 (Valhall-JM) and has the
> same number of power domains and requirements as MT8192 in terms of
> bindings.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

For future reference, the Mali G57 in the MT8195 has a minor revision of 1,
while in the MT8192 the minor revision number is 0.

