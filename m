Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B606D1BDFF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2024 21:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXDa4pJRXXSF53bW6sg5r+RrA4H/A0V2XZTYAKAhegw=; b=EtqRbvVoJizKY930GwXGttNKxL
	07pnAxQend/+0g8uGINvqDnVB9e2GlZEVSoMk7c5SqIXc+U6PeRIG04AO1disS/Ro+zGubZIKD5Wh
	EfnYOPiYC8551HSL4W1qUy/GiB1MoCID9PbF8lnSULdLaIi/PtUH+VnCF7TGNeuHAzAm7x9874/Mr
	HMPoCYdsGVTtkM8J3+Oh6Pxsk0oeCW8R24/bsolmx75KrX+cJ9FY5lzBVjn8E5lMDMgeiZ/q3Xq4H
	P84CfG53ULjMSbEsYHMdorjvoO9FERXehCZ5gVwHltFGUOGFuab85B7fBX/4E0ivwr1BU8duqindZ
	r5JK76MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t84qH-0000000FCV8-3eZD;
	Mon, 04 Nov 2024 21:42:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84QU-0000000F8AN-1uHk;
	Mon, 04 Nov 2024 21:15:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43169902057so36518375e9.0;
        Mon, 04 Nov 2024 13:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730754952; x=1731359752; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DXDa4pJRXXSF53bW6sg5r+RrA4H/A0V2XZTYAKAhegw=;
        b=m0hsLNhPSoQahPfQabGCYNt2wVGCMc0jK/9lHm50Jhzc6pjEU+aI9w4aiLYveEKbSp
         1Z1qTOCqRqME/QmWbuDfGq+T0VcE+QZFxixNxv5zq2JWfn1LYJHORI3MsUaVNSIkkUeK
         5niSuSS1G3DGDH1z+9uX+5aVvpqwtLeP5iaNYkpBF+Q6A6ogVAtVoKILF079Fz+knSEh
         mEclkWyeLyX8bkQABABwWk286Qvavs+fOHvOXmvnWeuT9o9ci9yP+fxFQwXriWNWmNhc
         CNZKnaLQYd71hislFIWTWHOwJIS9pi7bJwLoEd6TNVXyJ4aCTSYPNw8lQ163DkLcrOm8
         bt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730754952; x=1731359752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DXDa4pJRXXSF53bW6sg5r+RrA4H/A0V2XZTYAKAhegw=;
        b=CTeGqP4VZzKp0Z3JfHdJf9EchS4sP+PcLyuTYo/fzwUZzn6NEfPzSA2X+QWirAex6I
         /cQZauhLDRnX8f2mTbviTJmWM3xyr2ZY9LSv3kBNF2AHZBg3cR6HlfeRsG82zmduPDFx
         0UoYc8Cut5Cbt7zSqWJ/znZMLk7uMSOesYxie14xrAD5gL7ntco5uMmgzqktYc3rnrHu
         GBGiKn9HFCRDs4dW5hdKLDolTkRhkCOesp8/6Xu2nkXCivHRCawObepJSy4qZZj3hH6N
         4o8H2n1RCWoF06rmCRIW1oBn9YTHNB57xcDXqheuXCTsAwTGzix8V+Lvi2+XVfz6ul6E
         ucBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMKd+vyf/YhScMq77KbpeRPzWcy29QfI7CDDL9eVkYJq3CHc0Z47gp8Lp5exY/HOko0jl9vDPy1EsWoKTl7ak=@lists.infradead.org, AJvYcCXn9IrGxkeqMArDX27+XyrBbJ2NKoA4C+EyRMI+UXGjdlEc29ScepOhhL3bVqRYoH1MlBjtXFPEmofV/0st8SRH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw28Om88e62nQYlDbmwJ18i1TUKcB+ZAcqNx+R6BJLA96nm9uHj
	gc8nXBFvJ0nelPJCbnTJ5kAXRuAgEVbg8nj1tbVVu3M/++A8u082
X-Google-Smtp-Source: AGHT+IEFhX8r7t2wnhakUur8cbvnOFOryn45oEMeOTW1QXqNNbQOndMdabsi1v2egkHAs2YMkWfzwQ==
X-Received: by 2002:a05:600c:1c29:b0:431:588a:4498 with SMTP id 5b1f17b1804b1-431bb985df9mr186940475e9.14.1730754952179;
        Mon, 04 Nov 2024 13:15:52 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5e7c9asm169928695e9.21.2024.11.04.13.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 13:15:50 -0800 (PST)
Message-ID: <8d7b1c5b-346f-4d81-a06a-809690dd4c87@gmail.com>
Date: Mon, 4 Nov 2024 23:16:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v8 0/3] net: wwan: t7xx: Add t7xx debug ports
To: Jinjian Song <jinjian.song@fibocom.com>,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 corbet@lwn.net, linux-mediatek@lists.infradead.org, helgaas@kernel.org,
 danielwinkler@google.com, korneld@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org
References: <20241104094436.466861-1-jinjian.song@fibocom.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20241104094436.466861-1-jinjian.song@fibocom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_131554_528456_458ACC71 
X-CRM114-Status: UNSURE (   5.78  )
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

On 04.11.2024 11:44, Jinjian Song wrote:
> Add support for t7xx WWAN device to debug by ADB (Android Debug Bridge)
> port and MTK MIPCi (Modem Information Process Center) port.
> 
> Application can use ADB (Android Debug Bridge) port to implement
> functions (shell, pull, push ...) by ADB protocol commands.
> 
> Application can use MIPC (Modem Information Process Center) port
> to debug antenna tuner or noise profiling through this MTK modem
> diagnostic interface.

Well done, Jinjian! For the whole series:

Reviewed-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>

