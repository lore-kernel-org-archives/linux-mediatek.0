Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0C2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 10:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8bKwde4+Wg2CWc8TkxbadrlmxKH06gj/X4XR+XBGZ0=; b=1sy/mIaosX1eh4
	WkMPhIQ/bezWAZ3yXLFJcyNlcqMPPHq47Oi1rvOamv4tNRzJJ0jp6s4L5b3sgCY9RlFDn+dRbEaqZ
	BNmME0aRuSVM4MSX1EvdTo3elg1d9wqH4k6XfJx171YFV6RoBITvgbj1bO9PAqy3+LgijRLKM7bgR
	7KQ2iAfxFh1UUHnakXIeBPeEqebHiZ5G5TonZ87S36GrJloYU8EDNssmH3aWpRNTHmygREuAtB42S
	q7sIhNOK7gfeq3VvD5iVRtFIHs3jCKaaBOMkNuQVC++t9NA9Wn0FPNjFf6UeR1WMFxY57zzb2/oo+
	6NeRCBrN9qT/+jTgcvAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngkqg-002jUH-Ip; Tue, 19 Apr 2022 10:12:42 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngkqU-002jOt-Rh
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 10:12:32 +0000
Received: by mail-ed1-x52e.google.com with SMTP id c6so20588497edn.8
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 03:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ljBcPOYzzMcveeaTpLaxvNBjbVfcFDsbJwe+MZrueGQ=;
 b=IcRlHXNQVi09OXBZ/ixkfWis4KIemcrnQJght9cMh3j/iBkK1FY4X4iXV4XsIlUjnz
 dkaJeJP8jbpVTKfEGA+rLOVOvFq82ucsTzukmSNwfpr688fn3t8z89PIS4+3Td75vCV4
 31JkOU+F+D+ZkZw5PY9iYVrPKkRfjOhRcpVsKf4RnZ8R4UN5c6C0JIFNfeubRzJa9R4U
 4kqC8MHR949k5YlClbJbzkqr/akatG7LvJX32tQJNwKxPaxog2rAnDf8sA70azsJ3vPu
 iRZT2z0m8jtPjZ419h385VEKSxSeK8sw04066OmjhIO1fL5NWk9q/mKI8vOQ0Uj42f15
 3gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ljBcPOYzzMcveeaTpLaxvNBjbVfcFDsbJwe+MZrueGQ=;
 b=1FanHQWvc2iR8zRy/2ThfKRT7E+Qkqvgf0m0/h0XenxvImvFDWRkugv1ZsPHKoSPTf
 t168Jxhx2kxCzLbmW+vbnp1NJvUIJi3NZjPdBAtlmOejrWCqbA7xJmH6dXGzwxELyYpT
 MIoMMabG9GgMWqa4B9y1e3SziP/9zDNIfTwMm3hi6UEd7F3MJuQOo65mcSy6ayRHgxsi
 wPaN77JmqGcIrW8Xm4ZWUaoWtyODWxIlvGGXvdhY7YWNmlGYJFfnDsVu3ubJuasB+kAG
 vGbrgsQb+Y4jBNQL5dzJdnoME8KmmT9LS9BybtWKnAx2z2143eIM448Q2g+KJQT9Yjok
 SB6A==
X-Gm-Message-State: AOAM531HmI/EX+UlOL4ayqeio3q6Jo/krhCjxmj2uomZmdE/tK5kEpjA
 OOs6X5yyMtnm9m0Kk1mGaFHH5g==
X-Google-Smtp-Source: ABdhPJz6QvRX1yX7m7emWM6GxFi81gwx/a7fdGS3WU2xLYmolIbU/4q1xgzVM4PvSmrOMf7yjT7hIg==
X-Received: by 2002:a05:6402:1541:b0:41c:bfb9:d56b with SMTP id
 p1-20020a056402154100b0041cbfb9d56bmr16384916edx.344.1650363148733; 
 Tue, 19 Apr 2022 03:12:28 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 v21-20020a1709064e9500b006e8973a14d0sm5581177eju.174.2022.04.19.03.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 03:12:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: align operating-points table
 name with dtschema
Date: Tue, 19 Apr 2022 12:12:24 +0200
Message-Id: <165036314214.180327.9860190048104061653.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210820081616.83674-1-krzysztof.kozlowski@canonical.com>
References: <20210820081616.83674-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_031230_960316_2D4826A8 
X-CRM114-Status: UNSURE (   8.99  )
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

On Fri, 20 Aug 2021 10:16:15 +0200, Krzysztof Kozlowski wrote:
> Align the name of operating-points node to dtschema to fix warnings like:
> 
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml:
>     opp_table0: $nodename:0: 'opp_table0' does not match '^opp-table(-[a-z0-9]+)?$'
> 
> 

Applied, thanks!

[1/2] arm64: dts: mediatek: align operating-points table name with dtschema
      commit: c743bb394d35b782ae9d9ab815d6053500914533
[2/2] arm64: dts: mediatek: align thermal zone node names with dtschema
      commit: 54ff423f837db59db0626a00d091e45dcc46787e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
