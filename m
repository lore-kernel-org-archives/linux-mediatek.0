Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221A9C7EE2E
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 09:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2nCVCrZOkwudtPdu8IfLznRzJa7lQBEe+KUEz9jSjI=; b=Gbnw1CExtcX3jF5GIkMGKuwq/f
	vnrkWLuJ+fxPRH0M6S8lqbDmEO6ac3TLeUPOutppwM2DUCQ8IlMW7fo8ifIM2x0LaaprnmqttykHU
	fLDUNpIw3e0T1buzS8lLXkgutUWYQya4rw04kUafd5k+E3INnfyp6hxHXRRRFa5PC5xLk8YTw06K1
	6lOjUx7Ie14JlLDVdkG5h3AG5+VdU3lcVuVDZ2hZT0IKsCtMiG8wEhx8L3jJ1VuWnXQ9IngNBlyGf
	xGfm8ueaaadP0947mHrXse9TL6+OacCs20e4KASULTtX7+IE4f7JL5tnLbb9j/Z2ucNOvEHOmZGi4
	jXOF4Peg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Bzn-008hIk-0v;
	Thu, 08 Jun 2023 09:31:55 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Bzj-008hHL-16
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jun 2023 09:31:53 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-307d20548adso263208f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jun 2023 02:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686216709; x=1688808709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2nCVCrZOkwudtPdu8IfLznRzJa7lQBEe+KUEz9jSjI=;
        b=ZjkbQBZm7Dw969pcsyWCSsJ0MnYKqEAQbXFJU/2sVFXKohiH6CJEfMUuOF4ObEDdQU
         go/8wjrFCceGpauw8oxTdLhFGSVRBS1tep/cUye9RPDK1KXSaUUnBUZn4eT9x/3E9hqK
         KUqBHec+rGdQmlhmzLJAH5Bwy15Fx6HWdvU6YcV55HwzcG1Z4lFR5nnZdFQoskea1uoi
         LgjUYR/eIfkKyCCyHsikPfm9BeZeM/dVdifqlLMFI4N6F89SwU5lVL868pt6Fd6j8qOR
         ftpRlCewejJ40XYXibu/GvzJZ8j1NvCp5o+5i4gBE205mGaZhCMXMVXpSwrB5fFOEqxW
         GkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686216709; x=1688808709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K2nCVCrZOkwudtPdu8IfLznRzJa7lQBEe+KUEz9jSjI=;
        b=Dht7wBfLLfPgoaLH5+9ozynWEvKZ9n0P0wP8Bc/RDGsXHhEK2gwbHtM3TQkuLFyvKS
         TJZZbcNgFX0B5Z3+Y6u1Ua4F+KNs28nCtpbZ7ERQW019fEHSgDkdeZLeETvvqkU1XEdE
         v3Ovuh1zZGORLSQYvppADbvRKEr1ATOIE5Le1eCoau9OUcUDefHsaRY1dkheCZj0OAfR
         XqmkLTCz+IyYWxNr/chMNCxSA1rCjK04q089ph/EAg7dTO6iHHcMZKD2Ax5QMUNLwx2Z
         M+qqiDLOJ5eSnKM2pvrQf5EZ+jHrqHgMDBK5IcCP1Fa2OCsE64K4Mev5b+WHnfL5FREt
         q8xQ==
X-Gm-Message-State: AC+VfDzlJ2HUzNnQhaRkhZ3lEBwwtpa9WH0K6OlOnZwr2rHysFESvgPu
	LTwVlL/mJ5rjxr7dOpIXyZMZuQ==
X-Google-Smtp-Source: ACHHUZ40NzTTDqWA9zTHhxTdub04YOLlEmvfv0QlDvpHjEWVBGENTRh9QrlohidOCVV9ZUBd14W1nQ==
X-Received: by 2002:a5d:490f:0:b0:30a:ea8b:447d with SMTP id x15-20020a5d490f000000b0030aea8b447dmr6135595wrq.40.1686216709383;
        Thu, 08 Jun 2023 02:31:49 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe101000000b0030e5a63e2dbsm1018641wrz.80.2023.06.08.02.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 02:31:48 -0700 (PDT)
Message-ID: <adb0c4f8-f2f6-c587-9452-2205d0180ad7@baylibre.com>
Date: Thu, 8 Jun 2023 11:31:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/5] ASoC: mediatek: mt8188-mt6359: Compress of_device_id
 entries
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
 <20230608084727.74403-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230608084727.74403-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_023151_378742_C2529E05 
X-CRM114-Status: UNSURE (   6.27  )
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

On 08/06/2023 10:47, AngeloGioacchino Del Regno wrote:
> Those entries fit in one line: compress them to reduce line count.
> While at it, also add the sentinel comment to the last entry.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


