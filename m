Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814C2CE7A88
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 18:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xze0269DJpz1msfiE6vhhaaDti5lnwQMTzvMi8h07ck=; b=Po/9GOCmmhAl9dSt4Ihs+hvHPB
	sCTsKtLyrfftUui6iVxfhCu3pioutsu7HlLPmDRZDaVReUx9w5vri/Zd/d++wPAnYVcqAMQEZUpzH
	I8hybyxClXxz0NWt2kPRpu6sWkMdrZ4XZ06LGple3fW8w6pfIvrZYQYKJKbdzMobs8Ar+XQE+/eCE
	Aydj7I3Haz9BFy9pY69sSt/BrKQ7zXnbFOWCD6zm9JVimTuOtheJaaKbT3knHSuz66p1OWhWBCL/z
	LBgQfOIe2vC+SXQaO87iT8YULYIIPbzYKhGRLbafd1aHzYwPUVDR9XXf9tOu3B4G2FY87ZF/GcTNS
	cfCBqbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6yt-00BITI-1T;
	Sat, 23 Sep 2023 18:03:51 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6yr-00BISL-1Y
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Sep 2023 18:03:50 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9936b3d0286so487261866b.0
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Sep 2023 11:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695492227; x=1696097027; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xze0269DJpz1msfiE6vhhaaDti5lnwQMTzvMi8h07ck=;
        b=S67w7Ct88yl/2kcC+OxrPuduH4rM3Ju3sPDoGEve9+M9q0g9egHKDF+SkmtehmNJgV
         6QIk4Y+Ire/mmo20OnCfW0GegcofijgjSzAOfBqkTXAVPiYlecSXHDCYnV9qgO9Ruo3l
         J396L0IVUJ2h4nfqshjtTav6XKmh3SfEc8+0lBSe1ImTpE6EJywj4JLuqYCvP/eihHkK
         Q/FYZ4v5pq1LFrVkuid83pOXWuNb5y3ZM3eW+ptsxYdx0UCeJvE84DiNUUjAUYIAhbCw
         vtpgiNdh6Amfz6HlId+yf16Ob8rrZEAwkK1hApNN1+jg4NdQxoNfO24AfVw0Z5qlMKum
         gWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695492227; x=1696097027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xze0269DJpz1msfiE6vhhaaDti5lnwQMTzvMi8h07ck=;
        b=UIAHdl3bNUlojBASfD8icSojW5Wx4N/TOuB/6KI1NyZoE/l9ljSwP1YU3uBw0mt0/G
         UjuIUnQFM7oX/5E4N0YluRqrPnSJFkJ4njoYPYXci9cEgOriRJqC76p1EhDdHOcAoZaG
         AiWSH8O/3Q74v1QlErDkTu3LwqGcBiLrS+BzuLAUORIgMpznb3XfA5vK685+9PZb+/j1
         JUr/9dlsJwgLXOk3rCaCJiiWn2MWmncf6kZNXv3CMhFf78VNvsCyWUUsZASWO08HLYhc
         cmh1xWhWGmgXQ3bkCJa7qJd1Cv+dIjbkJZInN8djqxrxee/T2kKyuLuA1hsl/ajcsmSp
         mV1g==
X-Gm-Message-State: AOJu0Yxr7Op+mDVqLKEtwH5N9ESnN0dN3qHLyOl28CVc1Qtsletrx8vH
	iusn6RIIheCrVWLQnR811a1HEg==
X-Google-Smtp-Source: AGHT+IFIyimj0pgZ7ge+avAiCLM3XDnvT7w8KKsHu4Up7SRj6VF0hmPmN9BzVV/4AJRLlC92qYiVLw==
X-Received: by 2002:a17:907:7897:b0:9a5:ac56:3b63 with SMTP id ku23-20020a170907789700b009a5ac563b63mr2138758ejc.63.1695492226723;
        Sat, 23 Sep 2023 11:03:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id gs10-20020a170906f18a00b009ae40563b7csm4129447ejb.21.2023.09.23.11.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 11:03:46 -0700 (PDT)
Message-ID: <5d528036-e506-7b95-69bb-7748b26d2aa8@linaro.org>
Date: Sat, 23 Sep 2023 20:03:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 07/15] mailbox: mediatek: Add loop pkt flag and irq
 handling for loop command
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Elvis Wang <Elvis.Wang@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-8-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-8-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_110349_516840_0CFD3ABD 
X-CRM114-Status: GOOD (  10.53  )
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

On 18/09/2023 21:21, Jason-JH.Lin wrote:
> CMDQ client can use a loop flag for the CMDQ packet to make current
> command buffer jumps to the beginning when GCE executes to the end
> of commands buffer.
> 
> GCE irq occurs when GCE executes to the end of command instruction.
> If the CMDQ packet is a loopping command, GCE irq handler can not
> delete the CMDQ task and disable the GCE thread.
> 
> Add cmdq_mbox_stop to support thread disable

How or where do you add it? I do not see it in this patch. Your patchset
looks randomly organized.

Best regards,
Krzysztof


