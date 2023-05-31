Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767A6C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrOxajovW5T4Rbc75jHs3zSIJj4eFv63SxzUYy8QEwU=; b=vc/RRCAYFjBXuJvZli8Bc8q06S
	vgNF5ziRBSX+W02lkL6YvszD5YWvm0lQvtzLknP8XhBOQ7Pd52UtMD/GIjfS0C5X52/a+t0N58BdH
	OyjxK0Zv+tW6U5YdpWPxW3ErrwzhgJUSh+wD5p8Zk6XjAwz2drbDR9dd4I1Ny9PhmFlPGB02gti70
	iYAOnv5sZ6Ah0IRpE28EKYixhESaD6Oiam1FpgNr5ZFifMCwi0HeAZdU0zGr1umhmh0vb9zmdSOhD
	6Pp3KJlVPVTIjp2AIIi1IfcvrL6VRByA26zu7ORL7lzQwOJsO3jmbql/QKod7t/d/b3qQPPPtxhzh
	+cbrFZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4IJQ-00GtmA-2s;
	Wed, 31 May 2023 09:40:12 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4IJO-00Gtkm-38
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 09:40:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f6094cb2d2so57851825e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685526008; x=1688118008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrOxajovW5T4Rbc75jHs3zSIJj4eFv63SxzUYy8QEwU=;
        b=qUlVbwtJBWmIyaMOTjCP/Jml9WD6DnDXO4a8G5HdiF/aIRwSGT9KLO1PItVeboq7RW
         4se6h/UfuCnFxfNORMrQMgwKI56A2x/tV4LZ9HZQlos09T8x2x2GollQ8kkZsooJZS6Z
         JERGkcC87yHxF8AmnB2ONMaEXiBuKcMvi6Gh5MP8HfCFtFXuV49G+xaRg0GmyLsoZc0K
         QycT3N4DLTpkhqnuFESrGpxBiePWXdvPjnBgZ1njZslPsHu7ZJ1QFZstxHFLyc1/ZP4O
         GqoG+M/mM5pqDG8rNHzMit31d4DUyLje7OENUzOaQjra61WtsRZWt6e01Z51ugTx6S/q
         Koaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685526008; x=1688118008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrOxajovW5T4Rbc75jHs3zSIJj4eFv63SxzUYy8QEwU=;
        b=fJ73KW3hBEZ8F80v0Xg2NqrnUj0GIlaNlf6NpIXr5vWSF4jsYNL1X9Bnwl4n0lJOt7
         +JuF1TJPwWAZQPRgMpo82mvqCwGy4QaOGVRRFh+T3EN+GOM3UFR5hJif09fhYe8WL0qk
         yFt4swq1cEVvGUUf8KbtP+NrzifnUgWYywLdVYxCOq/YOJADxxkQ/TAWgOZ1q8nL/FXu
         lr16X2zTVkkjc1endGkbJY7RaoImzCqUqvrpwZO1z/uGpJ1AZXJURIq/5nHe1Q+y69/n
         Sp1mAy0C+3IMV636UgR4XJYv4j54F79KVNDvHIY9F6pdN2R63jkvOmKQ95+mwEGhIeWb
         xITg==
X-Gm-Message-State: AC+VfDx2lVHPnRRf7REV/0DJNyHMQX/mUpd5CuUcasLv6wvWQhRNbcsj
	eQCVt9pCNAefurMxKD2jESmEb4udaIz34qia0Fc=
X-Google-Smtp-Source: ACHHUZ7QLmP32Ur33JMLykY91ywIOn9nnqyILXvyiJhEBzynYD4c3RWkXh/LJXNTMuCZPlJB3qhBvg==
X-Received: by 2002:adf:dd92:0:b0:30a:b46a:a443 with SMTP id x18-20020adfdd92000000b0030ab46aa443mr3268355wrl.51.1685526008093;
        Wed, 31 May 2023 02:40:08 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d4850000000b0030632833e74sm6170228wrs.11.2023.05.31.02.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:40:07 -0700 (PDT)
Message-ID: <af5df07e-f93f-9588-4fdb-b89b37aa28a1@baylibre.com>
Date: Wed, 31 May 2023 11:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] blk-mq: check on cpu id when there is only one ctx
 mapping
Content-Language: en-US
To: Ed Tsai <ed.tsai@mediatek.com>, axboe@kernel.dk
Cc: kbusch@kernel.org, liusong@linux.alibaba.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 stanley.chu@mediatek.com, powen.kao@mediatek.com, alice.chao@mediatek.com,
 naomi.chu@mediatek.com
References: <20230531083828.8009-1-ed.tsai@mediatek.com>
 <20230531083828.8009-2-ed.tsai@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230531083828.8009-2-ed.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_024011_007686_2E78ABD7 
X-CRM114-Status: UNSURE (   9.09  )
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

On 31/05/2023 10:38, Ed Tsai wrote:
> commit f168420 ("blk-mq: don't redirect completion for hctx withs only
> one ctx mapping") When nvme applies a 1:1 mapping of hctx and ctx, there
> will be no remote request.
> 
> But for ufs, the submission and completion queues could be asymmetric.
> (e.g. Multiple SQs share one CQ) Therefore, 1:1 mapping of hctx and
> ctx won't complete request on the submission cpu. In this situation,
> this nr_ctx check could violate the QUEUE_FLAG_SAME_FORCE, as a result,
> check on cpu id when there is only one ctx mapping.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


