Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC83EB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcoTh2sPWLNGHJ3Cv2AGwq+IgylpFtXMhSdz8hYISoE=; b=EVRwWLzEtO9kZ2b9b930o26MmH
	dP/NYy16SKKg31W6aFY3uU5BtqdfoKfNCm4rqF0tQF8S+1aIMltOeONnJ4hj6h+2ne4wAxCa0vkVQ
	iJvvtRTcBTpLgmly6wgHuwJL8+4pc30l/LPW+hqoIj1KcXmUwGHySzg7WvY+tey0xxB8gk+fJOPeY
	1R55zbwVayaNuMDwGVNdE9omF/CVVUccA1nZf/BT6GG1EbnA9NuSreJ32j9Ce4aEIU4mUp3Xtku+K
	M3pWYrH5OxWetwzq0Qc/Q64QEqJJRldoGfeLqbppAUPpcPyHSjS8f/H/nf5M2LH0C3RuaYkIs8YZB
	DfuC7cXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMW4G-00BceQ-2W;
	Thu, 20 Jul 2023 15:59:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMW4E-00BccC-05
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 15:59:51 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31454996e06so801095f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 08:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689868787; x=1690473587;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UcoTh2sPWLNGHJ3Cv2AGwq+IgylpFtXMhSdz8hYISoE=;
        b=UmPa1+4v/9o9mWbgQ4+lTjHyeeBR6u7UK62B2H1gjePd9O4M5WG8vZ1+10En2Ioyht
         DQukURnmcZUFBpmE1xXeoKbtLz+nZffiIBRaLXOd1l5bv875j7Y2Cdoj4I8fzGfFqrDv
         y7CHlWO74e94RmAnpjS2RfG/G9ccZzWjI+6B64dprmx+qFwc7h/V8M/IplqFotElaQnO
         5M2XhPFrSM2KpYSY6I0T9BB9XatgwC8EPBZQR2YXgGKjq7X/cl8whnHow22WHEU4iVPd
         ww0CAnHyjJivEC8nxFwsV1d4w6mtiaUfK+RCeBZIBYJ55mk0+O16BrueLUcB92Eftq2v
         CtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689868787; x=1690473587;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UcoTh2sPWLNGHJ3Cv2AGwq+IgylpFtXMhSdz8hYISoE=;
        b=jLVs4Dg7OzZKuTKmSAlTWzGxIgc5YER8uqtaAJRsMOFakV+e3rB56TIg/S4Wk6Uhl4
         wQDG7dGk7hh4JZ0QUHt6AQI+uRWowjmOUrpr7Pirgql8JwPTObkbzYZGZju81omdq8ug
         3W+rbIbRevLM+8RY+vzT977GRjkL94IT+EbaARXhRkT+C/dz+q9hL+u6+HiLWOff2XZe
         inreJYXecjU9cWWJA+WKUVFj6z6DECxoAtN6kcAqQOMCGPBqALvv9v7AjZ3n3CfRQUWF
         4RCLaFJoLVvjo/gqIidWI0/jHgsOxMZxEcu4Dxv9aB1wpPP3S46Gn2Qj+JLkOMdq52z2
         sgYg==
X-Gm-Message-State: ABy/qLZaalbJeTcXqGnnM5FF647MBVjenRtCKl1k/rFVrcJvREK0APvU
	AEXW3b+rTtosc+8PYpurmfq62MlNKoJB4jQ2Kxo=
X-Google-Smtp-Source: APBJJlFJuKiSkpnQvuDgXExLT/wiie2rFVl7aKA4X/43U+4HxIZMk304KppNq+dx3eQW0WuzlLtphg==
X-Received: by 2002:a5d:530b:0:b0:317:ee5:b657 with SMTP id e11-20020a5d530b000000b003170ee5b657mr2227731wrv.44.1689868786711;
        Thu, 20 Jul 2023 08:59:46 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j22-20020a5d6e56000000b003144b95e1ecsm1685245wrz.93.2023.07.20.08.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 08:59:46 -0700 (PDT)
Message-ID: <89c36f34-5172-8a88-c389-0cd338458371@baylibre.com>
Date: Thu, 20 Jul 2023 17:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 05/11] drm/mediatek: dp: Move AUX_P0 setting to
 mtk_dp_initialize_aux_settings()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, nfraprado@collabora.com
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-6-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_085950_063226_914EE3FF 
X-CRM114-Status: UNSURE (   6.53  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 17/07/2023 16:14, AngeloGioacchino Del Regno wrote:
> Move the register write to MTK_DP_AUX_P0_3690 to set the AUX reply mode
> to function mtk_dp_initialize_aux_settings(), as this is effectively
> part of the DPTX AUX setup sequence.

-- 
Regards,
Alexandre

