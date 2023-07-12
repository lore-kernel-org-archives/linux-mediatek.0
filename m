Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AE8EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 13:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSRULxvfLJxd6xzB1HBFWn8lQ9a6bu29n+o7ble+0oM=; b=pV9tSNmCYV28KwYmuS9WsPrKQj
	lwD9uvSmQ5+5t5GgJTZEnbEvdPUpXP2gNbD4IW/4QRjacBV0xAUOiN8Z3C7rvRgMYwUnm/VRCICUw
	augNXElJYf7CZXJ1L6UIraWivEe1FwjZx4LS3DiJOh6+cmk37Ngk26jjYpBaAy9HEBY8+HF3/w8pF
	8tq/hCDYXuKWddEkOH/B6IXR6kyO3EWc63RjrTq17RGyR7v0RLv5QEFJ8ZgudxZlU0m7mme1BFSJY
	f3hQjLlfmkas01Pux9eULhFF5G2+U+DoqFEi/oMsTkdO9oCAVlR5gr6CSfALTCUcnMoNJg8tJ25EO
	9A2Re9fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJZUs-0001UP-3C;
	Wed, 12 Jul 2023 13:03:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJZUp-0001R6-0S
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 13:03:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso74557585e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 06:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689166983; x=1691758983;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bSRULxvfLJxd6xzB1HBFWn8lQ9a6bu29n+o7ble+0oM=;
        b=2Z6WUbg1BWfF9ziHsWsCLY+MUOoAcNFaklTXzSkZTQAlSdmVciQlqSxCkebunsw77u
         LsGvxOMKtNSVgfYjLdg5YVqbnOhiP8Kx0cNvc/UFKgVNXQRKEjCW76Hlm0N+iOv5ItJD
         Mc7CXlmor8Owt0aQp+syL2YDWzajC1YpA9b52xkVguI+01mIMcL0kgOHMvuj8vFS4h0y
         AUYeP1rYDTEW6z0s8cHCdBxrYYD0YRZ85jXAstxebOFMV6J7tD+TQECeCWUdxYJnL7WR
         sotm903lEjclBbYdIgSygvPzQk/sm2XkskduBMCxydqTWvnd/9EX5Xkhn25oYf6hjHxM
         0Frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689166983; x=1691758983;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bSRULxvfLJxd6xzB1HBFWn8lQ9a6bu29n+o7ble+0oM=;
        b=BXocLOnw5LwYX4kFgFcvmeCjL1TDgoLvMC+0vwgQm9jBUS/9tAxXYTNYwOcrEkffmi
         PQb5m9nLGne4k3HBhWTJvp6k5p4Gdy4+QrZT5FEaXsEBGLzcqISp2tvA0B/ByWLG9OkH
         1Pe3cM/LH9Yr1YiObJnkx9D5ll1f/tvxeUVW0IxwOP0J+JrjZdaZWTalJGKKh0X3H/sM
         s+UH456/+UzQcXLHTsxvbnS4b2/PIJEsnxJ8wEqWT1eJ00NNsoo1de0cSAybDnJJLjUe
         aC4YJlBaSijK89LXtIDgMRK21cQ0aqo8hAfuQVwnlfFWhH3bf9ByuMjXzxL3mkwc0nJD
         1rlQ==
X-Gm-Message-State: ABy/qLbJP40tLM2vfXd0fSn1ayn/RCHGmwSs6nbLmWWXwcPZ2jJ27954
	V5VCPAvT++jspbRbWdJ0k7lCIQ==
X-Google-Smtp-Source: APBJJlGSQc4f/DWJNPIm30X0RCk8ibYVWS/PzA68G9YIu/iC0V9OZ7UmT4v3sNNuC5ijsDPsj3unFQ==
X-Received: by 2002:a7b:cd8e:0:b0:3f9:b9e7:2f8d with SMTP id y14-20020a7bcd8e000000b003f9b9e72f8dmr17191551wmj.2.1689166982085;
        Wed, 12 Jul 2023 06:03:02 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id l3-20020a1ced03000000b003fc0062f0f8sm5101025wmh.9.2023.07.12.06.03.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 06:03:01 -0700 (PDT)
Message-ID: <c331bfa3-443d-0976-fb14-e6e97fbd7d58@baylibre.com>
Date: Wed, 12 Jul 2023 15:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] drm/mediatek: Fix iommu fault by swapping FBs
 after updating plane state
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230710093253.32224-1-jason-jh.lin@mediatek.com>
 <20230710093253.32224-2-jason-jh.lin@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230710093253.32224-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_060307_197332_124D08E9 
X-CRM114-Status: UNSURE (   9.31  )
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



On 10/07/2023 11:32, Jason-JH.Lin wrote:
> According to the comment in drm_atomic_helper_async_commit(),
> we should make sure FBs have been swapped, so that cleanups in the
> new_state performs a cleanup in the old FB.
> 
> So we should move swapping FBs after calling mtk_plane_update_new_state(),
> to avoid using the old FB which could be freed.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

