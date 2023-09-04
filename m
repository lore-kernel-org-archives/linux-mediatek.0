Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE6FC83F33
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 12:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fe52d7wymHVSRnUd4doTrEpU+qOQW0Adu/PC0B+zMbY=; b=n5qMY160g1u70OR6uOKSMUlkjH
	xbOrJhwg+PkRAHtXsIpsZlTLdoJsiFg9MLKH/JrUDZcua8mxkzX2ewZJytRthtFTJo0znud4hNl28
	vjZVc+bI/UDLe+C/ejtXWWbYgCs0ySfXYT7eiepSgrhAcgjolD7yfg/TWsNuO0suIHDXKkIop96iW
	Xzdps6q1LoQRwokGQLU3UO3jyUlEx1v3J8/579vmQf4TGf3D3Gu8AmLN7w8xV+RQRPM2GGCHIY7SH
	JXGybfzmfmPqj9prxsHlzthR8H9UzI1hTOqg+lHHhpT5Bv5X3mgB4d9jWa4ebF/aj7zTp2pIpP6TN
	/Tghd9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd8Ol-0042vb-0r;
	Mon, 04 Sep 2023 12:09:43 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd8Og-0042ue-2h
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Sep 2023 12:09:41 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52a23227567so1823626a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Sep 2023 05:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693829375; x=1694434175; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fe52d7wymHVSRnUd4doTrEpU+qOQW0Adu/PC0B+zMbY=;
        b=MsHR18nIsRVyFcfWZ0uWNMEzZdZCzF6Z82htCtAErHgf5t4Yz+nG8QL551egqAL/si
         pMAE+TTzDIgWjvYJcbhONNBjcrZ6Z96OiVkARtAjYMNXQrH1hW08LBl5TvW+nwt2JRec
         7n95ArS7pAemYqVbyE4YNBFbOdCjiszCkqkBcTgf7l9px0m8XyndEKXXRuIsP3wSHNzL
         az/6zZddXav6oqvx4Ql+WBAO3DpiNLU5dQ+CgmLKPcAByayUX3GxzlROu93g1O2UxtZR
         uO1UXq43tAhFMJoMCBDPsk5KKrnPnsLsNwMbmYiYBWjB4IdMZbxdEsesh+FfRAQq5TAl
         zm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693829375; x=1694434175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fe52d7wymHVSRnUd4doTrEpU+qOQW0Adu/PC0B+zMbY=;
        b=Oxnyr5TwJYkQ+fxWBYtdiFX6l5WCeicK7wFVA/jffgF/Q4FmMLEu2B9YsERSIpmmJJ
         8LMZd5hTPL7eOasaFzayyZuU3K8AxJ0wHsFx70O6MrlUvkfwfdPYc8TpXdWkgSSSErlc
         ucU6JgJcImdatH3c/CeUWpBaajLdRLpBQvSoWuSZFAjtXjfqu3Z7Z4Jhc5gy3AfbrPfh
         EKc2kJUGlkcg+myRimUQaoZqtjbqymWJBtRtMcuJrLiOhNiBNUY418yZaRvjg0nFGHES
         lWDefAgiO2uTUmD0wRy0Rjyn4GEj2q9I3InuUpI3jRJrq8NrEYwVw+5Tnaft7+ffQzPv
         jiOQ==
X-Gm-Message-State: AOJu0YzBEJ/bwME/Z7pTSs2YRChCSPk35pgM4syPvi7iu4zpeJq5Ne0V
	rxp/+u6sHmAhTvrt5bRLoQl/eA==
X-Google-Smtp-Source: AGHT+IG4htU9jlytfOWTOOiTRhiMXfK1Yx8nBb4GGdVYDdsVmhh1c205BCxily+P8XS3+GVSvF6GUg==
X-Received: by 2002:a05:6402:1f82:b0:52c:b469:bb01 with SMTP id c2-20020a0564021f8200b0052cb469bb01mr3263539edc.38.1693829374607;
        Mon, 04 Sep 2023 05:09:34 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id g9-20020a056402320900b0052e2472f884sm1443153eda.21.2023.09.04.05.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 05:09:34 -0700 (PDT)
Message-ID: <e380a452-ce93-8af2-4075-ef23987d693a@baylibre.com>
Date: Mon, 4 Sep 2023 14:09:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/mediatek: Add spinlock for setting vblank event in
 atomic_begin
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230822132646.9811-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230822132646.9811-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_050939_084191_439840E6 
X-CRM114-Status: UNSURE (   6.19  )
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

On 22/08/2023 15:26, Jason-JH.Lin wrote:
> Add spinlock protection to avoid race condition on vblank event
> between mtk_drm_crtc_atomic_begin() and mtk_drm_finish_page_flip().

-- 
Regards,
Alexandre

