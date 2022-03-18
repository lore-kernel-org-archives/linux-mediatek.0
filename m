Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1915C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 09:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frEVTo0TZOxHVvr8NR6sT+W6Jbr1IRo1q2OzcLh7ESA=; b=fOM4wCuPlsBPRR
	4lNfSfd1dpcGbtn8GFawa6mD0xu7iSwYWwWajmj+fyi78TF1P8kXxU9mhZ5YsGn+CdTz978THb5Uq
	gt6uvj8jGtAV4bPyEUNHBLqPc/IEzYk7FARY5AUbI5lJvf+m2KEHJC15Kjoi+KYihmhZWWYJyz/WT
	Wo515i3a4/FOiS/7HbQxfu4rayihIWI/auBfwMvte+i59wJ0nZiD4by0S+60VwIaLogIMUcT4Fvbj
	+IohnIsBM6VdELj0Ko7l+l53OPOMUskbMd7qrONU1Wf0VGn+x/tX9ZPgxcrEqDbkqQDvJBNMqK6WS
	H9mCHyc99tk+fExpWTvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV8WT-000vLK-Rz; Fri, 18 Mar 2022 09:03:49 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV8WI-000vIu-JK
 for linux-mediatek@lists.infradead.org; Fri, 18 Mar 2022 09:03:41 +0000
Received: by mail-pl1-x643.google.com with SMTP id w4so6484341ply.13
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Mar 2022 02:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=odQm7JC7x6Af6z1xpDrwW1/gihmZD1Kc4UPnG+M8gbk=;
 b=Eadxx9IjG5BtCfRNZOsVfpiUvgX+GSL8Aib5ZyUV9lgIHPkzS++xIEPd8SQvD7dr4O
 lRMCKC3+HcqKnSO+owRwtnjwu+Szmu/11TRJ3PrQzIq5zE1TNLmIreTHFWMS5JFJw8+O
 paZrWzVmW1F4FOVuOGfDieu2E/8E8KMDToCKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=odQm7JC7x6Af6z1xpDrwW1/gihmZD1Kc4UPnG+M8gbk=;
 b=rdYBlhoCe017eL3It56LIHkcEriNSB6p57rMb7L4yHJnBAmGEo7+6W/hHLFz8XMII0
 JbzSVqf9u1upxhxmnZ7u4pOlbwS1W0y6mcC2U4hO0Z2HObmfh7K3b35wPJ2wGn6gGmPb
 34oi2T57yzXo6v+eURnjuWdhpemXoJTp2YfLzCMbS5r7n+emLLRo5lHBWjZIY/MnclQF
 FbGM53taFCzHeTPqHkcU0XHqy3ANSX9lxahLfNWoX4U7Hj/jAx4Q6uqm8CweQys2M1cr
 rq+uJVN36Puac7Lb73HQdxF3jTAsnp0k+URCupSaBXfxwYxuLymSwoU0O4zRpSkgvdeN
 C44w==
X-Gm-Message-State: AOAM533M3eliU0vUp7PTuT1lwsdXq0y/LecYqdEFaRGJNO2j7NxvHzPN
 kZ/vZI8D2neqHKQ+2rVMz2RKRIyTlApYIWUjLeLEbw==
X-Google-Smtp-Source: ABdhPJypgGRBlo6a3uR28YkQzfvVWixDNkdtCp94bBE7F/dwhU59fOqpvNDP+GJghMH+n/vIuAJsfN6r7kejo1jOdfM=
X-Received: by 2002:a17:90b:4c08:b0:1c6:40e4:776c with SMTP id
 na8-20020a17090b4c0800b001c640e4776cmr9989598pjb.237.1647594215955; Fri, 18
 Mar 2022 02:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-18-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-18-granquet@baylibre.com>
From: Wei-Shun Chang <weishunc@chromium.org>
Date: Fri, 18 Mar 2022 17:03:24 +0800
Message-ID: <CAPrDo5ht246dgPJmJBx7Xc6e1kqdw54C1eDDqMA347ZwRtAO7w@mail.gmail.com>
Subject: Re: [PATCH v8 17/19] drm/mediatek: add hpd debounce
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie, 
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com, 
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de, 
 ck.hu@mediatek.com, jitao.shi@mediatek.com, 
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-fbdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_020338_672528_9C77BC60 
X-CRM114-Status: UNSURE (   7.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 18, 2022 at 4:49 PM Guillaume Ranquet <granquet@baylibre.com> wrote:
>
> From: Jitao Shi <jitao.shi@mediatek.com>
>
> Implement the DP HDP debounce described in DP 1.4a 3.3.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Agree with Rex. The code is fine but I suggest including Rex's info in
the commit message for clarity.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
