Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AF1C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 08:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5J9GzcDFqKg7ViHZPZ/PP2Mj3wu/WmYEWkXBe2tOko=; b=lhf25Qx1FLuwkO
	9j1lFAD4tGTfgH/WinZH1lmU0/dDbrp5wYIF4xdsUcymUX0MlL3LgqBM9bgELLcUStlHouga+MEJs
	N63rjmKxLJFZNVrOtepAJ1vALW+eKZZ/QoSl/VMN0ALHye7sXt/OxiwnDCdeQLW7YuVAS3m++/RjW
	YQBYx821UP7aaxm5dKfSr+JL1OhD5tUXxode7yfWO5KUF94O3vnr1Th6iJhQYofh5NTcVhF347KE0
	iL17mVOOgsnAGzm0exPHGj6K7++0EbceIt041T/lubUc7m9k29kIIpcXhDQV6qhoUaM4B4cVa/1vt
	A2X8U7dcW/dOCGj09Uxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npQhV-00F4nb-Qm; Fri, 13 May 2022 08:31:05 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npQhU-00F4lI-40
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 08:31:05 +0000
Received: by mail-ed1-x531.google.com with SMTP id p4so9161020edx.0
 for <linux-mediatek@lists.infradead.org>; Fri, 13 May 2022 01:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YYULx/OnPBkCECxsG7VLLrURpygBJH5ZkPirFud1SVE=;
 b=lOSafNyROulnVy8THJdx8OKlyBp0zwQHyJxgAmnLmuvlJPXUQF6yKlQzqJX+YkhqTz
 9dMeIkz0Gesa4LD/jWqEOyP4/iV/i/i+RqImeVsg8fPLrANSOZUP/8ZI0G1fI0TXuQQh
 fyOS37pzxILCdPITgn9x4MZ51yIY/pQQJN4EB21dwewt7QPRrdwQjF6h49xNK7Rhz/by
 cqXV4Amnd7jgGV4KKE87OsU26ETTVDJOXwQV9FhCQl/mted086Lzk6kV29AKolgRiAlJ
 zFeOIO3gEec5+ZuyTb+eNAjU+MY/V8YGM42itBGARoxVYbSdgRvH53x7TQGKuO2Wqrrl
 0H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YYULx/OnPBkCECxsG7VLLrURpygBJH5ZkPirFud1SVE=;
 b=ZayuRbTgu19g6jSmH/Ji4WvCgxe3fZBRBCPLinvwpI9S1VDghOOGftZHkhD+KbX0FS
 Pi7ilFpS0ekaLB1gsYUfSqAhcF1moo+E+2eai6Wu+L6ELvRLswvoen0RpDH0p7vL/jg4
 tYv7rPTfXkjBzy4GxEEDSwYxcFrZZdOv1ZSEfDM2AuRj0aO3hQbGAN+YeMaEv39XujH4
 aTmNXHQ3Euzbib+dtmmZAmvhq8T+rBN3Da21d2z0d8TlRQUWRRINCYunl24q0aBvAraO
 VGcTOG+1KcdCol1Y3tV3NiqTsHtgXLKaxg9uy5WPpt5J/fPR+6tA0lXx7Bn+rXByzvTh
 5Owg==
X-Gm-Message-State: AOAM531g6HIq2fKVtuAN3HVt6su8tF3j8N1AcT8ayPSKLGajnN1Kgmx5
 5X/xMFU/QOZZCRRt7d6TxwFjrA==
X-Google-Smtp-Source: ABdhPJzd8GPaDVoXg/OxBKEu0HQy+3pM0sNyGWfsDQVQO0Bh3xsbSY7T3pykqwPP6VZN+RlPSF0mBQ==
X-Received: by 2002:aa7:c6c3:0:b0:425:b13b:94f with SMTP id
 b3-20020aa7c6c3000000b00425b13b094fmr38756205eds.313.1652430660375; 
 Fri, 13 May 2022 01:31:00 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 l13-20020aa7d94d000000b00425d6c76494sm675174eds.1.2022.05.13.01.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:30:59 -0700 (PDT)
Message-ID: <e2895c7e-0a1f-b81b-25b3-0653c7e863d4@linaro.org>
Date: Fri, 13 May 2022 10:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/3] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de
Cc: airlied@linux.ie, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
 nancy.lin@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220512080523.25082-1-rex-bc.chen@mediatek.com>
 <20220512080523.25082-3-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220512080523.25082-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_013104_245281_CA45FFC3 
X-CRM114-Status: UNSURE (   6.87  )
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

On 12/05/2022 10:05, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 reset control bit for MT8195 platform.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
