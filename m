Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC09C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Apr 2022 01:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7N1tFQyzml/cCIlEAzW1rftgxUBu657C2TeHoY1/vuM=; b=jbBiDlCNl5Ws39
	B+0F/FPMJN4zAxreV4Fml+N7vGBgQmRx8i8nkR6YeKTw9pN9XX8Xa7xemiekrwKgdHu/twsSp3VEU
	hHryGf8dcrrbRQbK/wRo0nisdKS470bhJaKRgNepXrg+2nQH5ROmXhtmqF6y7yugqXo7hXuf7DXOx
	+jlIMDQbee0iWG2Nk7GZQhobutwPA7i1kXK0fjiDagtigQmdfWu/5B3iWp3Q56u4xkHqgU2cUCizx
	LXqkES5IMKzVkiNiT/Yn1xqWV53UMa6IhZ3n6A4HEHvmL5+fwHSe3OinEJgR1ikwMI+spiA93w0n2
	OH8D1gaba+vQ+caeb+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nczyn-001euS-IN; Sat, 09 Apr 2022 01:33:33 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nczyb-001eqy-Ds; Sat, 09 Apr 2022 01:33:22 +0000
Received: by mail-pf1-x436.google.com with SMTP id s2so9902408pfh.6;
 Fri, 08 Apr 2022 18:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hpGiOlwZfN1jegaUT8eMVHpr3PeOblVesX+ImSdkAQ8=;
 b=ZO8uMWA2fG1KLvzigIS7gvwyOWW4qmJrY01xCkqvpyycNLuBl4+flyvB8LR4X0G1kJ
 Kc4ANlBrhNkTeNFxW/IPC64X86MgSNdKLqy5Elk5gJi038DHHCrG1qksTneJBbbcRKFl
 lZkg1m513Ur2s8JKqh9D3rbw4FQe3uAXSdUogPuv0t3Sdra1xYIFQfYEW8p2gSEKYIIr
 +jXhpnJb6ksdP7ZKRolqP8a+HfFLX6/kyo909LF53GK+RYFfAD6bMkcCxlqmh2GH37AE
 2jKsAiayVBvoegnyrbIIxtihSUATgK/Px5prhbQOr4iNd1Yy6A0idTOuGectlNihxade
 VQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hpGiOlwZfN1jegaUT8eMVHpr3PeOblVesX+ImSdkAQ8=;
 b=6ZnMw+vsKv6+ET7NAHUsDY5Sww2DDsjx6VHsmzOSanI1BjT+pUkqYYFc3J+s4DrQwV
 lBNCRawzufEedRTXfkdh8eSaRTzyAh54s5a9Jtqj04X+va0qVtyaS2ggPQwD0l+xONTq
 SSMw+A8wChxQ9Hsu789A+GrTTITydzLWmao0Zf+hLm9jdl9UOQMGUYU1YIBQIk1QJlaz
 phLRfDJzChDdZ1g2B0Q44nTESVw1k890MJeJmgjf5WR/Go3QCCi4meS/zpKfP72FWkeP
 0Jd5Ox/qbePjaUjcWwZj9systpaF/SvawjXmZSj7a2Hb1PKlXeN5xabbHFeud2WqdkXg
 Qa+g==
X-Gm-Message-State: AOAM533yUa+lbzkpkExfucgFAhhSK2FJfeTr3XUq1NKdDHjGUZM9bM3M
 4Gwmv0RprkLOvyu9CbFeohM=
X-Google-Smtp-Source: ABdhPJzSYwdL/glC3XYkPSqPq+OhrFtXYnZ1z3wcjbOxxdf+2CT+t7Z/5B90wApXI59Ehu7T7Ti/Rw==
X-Received: by 2002:a05:6a00:23c1:b0:4fa:efcb:9c81 with SMTP id
 g1-20020a056a0023c100b004faefcb9c81mr22113232pfc.75.1649467999513; 
 Fri, 08 Apr 2022 18:33:19 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:9186:332c:bcb2:4506])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a056a00198900b004fafdb88076sm27375953pfl.117.2022.04.08.18.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 18:33:18 -0700 (PDT)
Date: Fri, 8 Apr 2022 18:33:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, mkorpershoek@baylibre.com, lv.ruyi@zte.com.cn,
 m.felsch@pengutronix.de, fengping.yu@mediatek.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: mt6779-keypad: Move iomem pointer to probe function
Message-ID: <YlDiW0dpZ7A41j/Z@google.com>
References: <20220406115654.115093-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406115654.115093-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_183321_525457_2DEB8447 
X-CRM114-Status: GOOD (  11.01  )
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

On Wed, Apr 06, 2022 at 01:56:54PM +0200, AngeloGioacchino Del Regno wrote:
> The mmio base address is used for the only purpose of initializing
> regmap for this driver, hence it's not necessary to have it in the
> main driver structure, as it is used only in the probe() callback.
> Move it local to function mt6779_keypad_pdrv_probe().
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thank you.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
