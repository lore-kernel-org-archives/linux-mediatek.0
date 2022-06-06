Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E553DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 09:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BoDToyovuWupLWwyZbrm8MByFhoWlDVHRx1F0/dQBs=; b=34ArzPE1cVDzv/
	jFNiTRxkzgajynk2a43vsADAD6hq7Kh/l6sePJVBaVhk7QhEfgnLgg32/t1EqD4ixZmwdGwX+iWD4
	pMZm37SO60a1EAXln8yljh5Avjdp5Pp5XZBGjTJ1/nE0mdnOfApdlsrk7HHX+PxDeBHmkzGVwz8xm
	XICVxcgTMso1TceyxdzAQ+3a0peOHVmpwGd3V7Z1x1u7XsK7dGBOwmr8lS8+iqBToUFahW5keZqqC
	rQ+/EvNCxrEYDbueBqqj9DjYizhkLRDhLpkpaQaDe6V9RC6Vk4GQWfWDMYLuXkRL/oKW7eYcwTyci
	hLXsuEo3VBcqum9x0nTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny8vk-000MXD-J3; Mon, 06 Jun 2022 09:21:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny8ux-000M5t-56
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 09:21:02 +0000
Received: by mail-ej1-x632.google.com with SMTP id s12so20492462ejx.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HXs6HQ5wyWOtIKdzW/IYeIhCcS1S7l5ftevZGxUN+go=;
        b=AVFs69BTF+v2nl8khzB4ASec7iczaV1WEjwifjve4cHCqJVGLV4NVpSYI/wdNlpi/N
         jBvmyTTlUQLhM7hyjskmtZTjDDNMzrDTPLH242cw7ZIK8xaO+bV7RDdmPqAZcpzREU7K
         8e1zf5Fnrnx9g5u1J/yH209/EU5jamOgRsDCuDt5vEStjmDYChcGkrqm4J7zs6w8KV2S
         J1nxpPUW8xDShO6lsLQqutirkjQhgPNoWPh8DggHZNJmFXboWjDefVapqeHBLgLlv/0f
         dGo31ZddTlFaT2kny8FY6aLcFnTUHS7hdakCOoSTNiWDRr9MqvctZ4StmUcDazB8LoSz
         zFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HXs6HQ5wyWOtIKdzW/IYeIhCcS1S7l5ftevZGxUN+go=;
        b=HvWKCsccayLiNTlmV6Igaejv/9oG/X9A+DI4tag2g1qAU6y51iX9q4kcU9L1x9vPE9
         LqiFxfhtvmKiAhzXh1yTR7TwaeWRHMqd+MpYVCiTv7uoNHwrvKnD1Ey64gwQj+es2NmY
         xG0Iprg4u3NmeV16dk8yAHHtqBlTJhsNiBG79esYL8NGXF8pslDufNcUXmzcUZY8BRC3
         5m2lSVVJsf7IOgQSdyX5wLdqTjla4CN+a4ijn/pNP56VjB2XJrh5JfX63Soc1Wf5mHV6
         dnlmV8HMx76bC1p38EGpF+EF4/U4TeuLVjtULJBX/1MRV0+wWJ2TLY0Czpwlvtni/mja
         Romw==
X-Gm-Message-State: AOAM530A1gkn8bTSrxBAoiTE9m/NXrp22M1sdt9J7StpQy9ea0B9Q4+l
	PfCm4nWKWv6XLozgWvb6ZAIGPg==
X-Google-Smtp-Source: ABdhPJwUBwoX6D2ZyEBxBT0G5klDaphwJEUpH6FhwVTkIdE4hmlutl09N7ke28WCzNQ8obWtXq+LpA==
X-Received: by 2002:a17:906:38d3:b0:710:daf0:52f8 with SMTP id r19-20020a17090638d300b00710daf052f8mr9469554ejd.406.1654507252467;
        Mon, 06 Jun 2022 02:20:52 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b6-20020a17090636c600b006feb6dee4absm6067412ejc.137.2022.06.06.02.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 02:20:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Yong Wu <yong.wu@mediatek.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Ikjoon Jang <ikjn@chromium.org>,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] memory: mtk-smi: add missing put_device() call in mtk_smi_device_link_common
Date: Mon,  6 Jun 2022 11:20:47 +0200
Message-Id: <165450724182.62574.15544602026083220170.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220601120118.60225-1-linmq006@gmail.com>
References: <20220601120118.60225-1-linmq006@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_022059_333856_B3546CDA 
X-CRM114-Status: UNSURE (   7.71  )
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

On Wed, 1 Jun 2022 16:01:18 +0400, Miaoqian Lin wrote:
> The reference taken by 'of_find_device_by_node()' must be released when
> not needed anymore.
> Add the corresponding 'put_device()' in the error handling paths.
> 
> 

Applied, thanks!

[1/1] memory: mtk-smi: add missing put_device() call in mtk_smi_device_link_common
      https://git.kernel.org/krzk/linux-mem-ctrl/c/038ae37c510fd57cbc543ac82db1e7b23b28557a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
