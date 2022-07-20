Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4295EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 06:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvCLm5C4QwrCvu37BPIif9T1t6U/v2ik0pFn7OOeGZc=; b=ELOqvn2Kb2wkA5QbpTnh/hR9/0
	0YBq3pOvfwuMAQYIMMETQ3om+jHvjZn7VkqD65ChzPmnoXbejKMBTQE46gosREhcrYfokvTgXLhXW
	vWfsbWo5IXNJDkIDaHhUuV5lPcrRVYL4+UrVqZNUtSddmFUogC53neNs/2QWyJ7eFFbUUTLSK13Eq
	s3a6WzX/B7ee4isHzXei8wZwBGQTx9MU3S0SKdZqadt3gY4HVyHxHPclzDWPiNved8f1/PhMNtump
	u6kvVOmdRNojPTiza3dqZB5nmsBi11KPp9ak2te2YCP67IFoP95sSMKuVgIchXiZoRFW1zfllQ6CX
	OrS4k97Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE3CN-001JNZ-UP; Wed, 20 Jul 2022 06:28:43 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE3CF-001JFi-Cr
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 06:28:36 +0000
Received: by mail-lf1-x131.google.com with SMTP id y11so28613683lfs.6
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 23:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZvCLm5C4QwrCvu37BPIif9T1t6U/v2ik0pFn7OOeGZc=;
        b=EDcfoiOEv5QDtsjnmB+++fYI+PYvq75KR2vME7ZodpkSxQyxdgKu5xeKDYtiB+BBnl
         I8WRvH+SfCLC6PwLlYlptY/tcl9taDXlyncqeTDLoK2P+1XZIvUJV2LUgusNHDpEDggf
         SGt7Co6UnZ5Lq80j1ZC4MVG31B3eO394wWqFRKreaipg+Nnkt1xsowSg70s2ETyFxjzi
         zkLxIZlFburRLBAh7eM5UbrYuCwIiC+n3A3TnTnvAV40xQB+yleW8tObS64Q+crcntZa
         /mTE0MGAqlWL/EY4kCOSFPHxTxj6N6/AoP/2mmwHO0zlD4E+niQ4ht5AedKGDeO01s7F
         IlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZvCLm5C4QwrCvu37BPIif9T1t6U/v2ik0pFn7OOeGZc=;
        b=cWUdBxH6zC7Bq/LwTEdacE2YDKOmTFMp1oInW+SzgVmCNZWPq65LBQMkZvmMNgP2BI
         H3OKkntGH3oG/YVYQzVsCW0QjW9dQHMuZxuh1xVd53pG8+3Wll7m2javIhlyafBSksM3
         NAgAWUE8/TcO8KLQMxZNMUl6KSHDeHKgKDtqWdF4ZhjoWfuug5DDFwYqwh5PqWW/cozW
         TDnZqe+s+wyktblvbZg1/ToHewn/Pt24WafCk9O6cUv/PmuUiWLqt9aFltxzP2ttNl+/
         o3jHrjpCHhL/17VJCiWEI/FCYFm07CWcP3UUs54ze/taqk6Kzeyz26wHBBzfGU2t6g+J
         U5Yw==
X-Gm-Message-State: AJIora+rP/BE7phGaOwqtypaKPI4ppU0FWiUE/I969y6VhjFxhgn3+D2
	hT20PyqGdrbapZ586VtI7BJsrg==
X-Google-Smtp-Source: AGRyM1u+UekMgIs8vfRrABHoyjMOU+hs7YnksYxtseaC7qX43voYEegkZQl8Z5I17mIeh0wH55NsCg==
X-Received: by 2002:ac2:5972:0:b0:489:cb5d:9c4b with SMTP id h18-20020ac25972000000b00489cb5d9c4bmr18270243lfp.45.1658298511658;
        Tue, 19 Jul 2022 23:28:31 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id 11-20020ac25f0b000000b0047fb3ea0659sm3604186lfq.292.2022.07.19.23.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 23:28:31 -0700 (PDT)
Message-ID: <d506a523-6638-78f3-6a7d-2d9312302403@linaro.org>
Date: Wed, 20 Jul 2022 08:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] dt-bindings: media: mediatek-jpeg-encoder: Add MT8188
 compatible string
Content-Language: en-US
To: Jianhua Lin <jianhua.lin@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220719100214.2096-1-jianhua.lin@mediatek.com>
 <20220719100214.2096-2-jianhua.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220719100214.2096-2-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_232835_500464_7EE27D58 
X-CRM114-Status: UNSURE (   9.47  )
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

On 19/07/2022 12:02, Jianhua Lin wrote:
> Add compatible for MT8188 jpeg encoder.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

