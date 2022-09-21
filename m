Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BD3C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o92UjVoLO0OXcvAwMiK1bLjOHoeEyzcWej/QRBeDoR4=; b=VPxx1KXE4I2DBudojujvk5Cvw1
	XmCknOXd6GVcvWah4iyRhYsj+p5QVKuNWP1TVb4b+kzvCAhfSeF5KAgWjHmM0wZZob/e5Ouh/1Hmb
	ls7iMu/5cY/i7tqbXMYP4CE0Of5rpp4xuZXgps24rTP2LFjtYEo8xOmAOU2KTHencIVNv+o9DqkVR
	sCWSvcZ9see7stDdjFm1E47srKAmbYWXRRqWNpN5DZRpr6zu65dTe+DKYyAFLIuADdaEaNXVQYh6F
	+gSWjk5E4x0pIrViKkYA4h/NKkE7GVy3MMQgh1ayf6jHum9j8qDIum7m80VaX57zI/nwkbR5Fereh
	uZymJD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavz1-00ANfb-Oc; Wed, 21 Sep 2022 09:25:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavrG-00AJjf-Ad; Wed, 21 Sep 2022 09:17:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2DD14B80E69;
	Wed, 21 Sep 2022 09:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1966C433D6;
	Wed, 21 Sep 2022 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663751847;
	bh=U2I2rOq/quTseGcL7DoJKHssxhvKxWZ6qbZ9HMmsUr8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MMANVzFW/zdQo1U0bB0i/Nms58BzOuxVMG+5x1D4ML5Tkw20Vhw0oUVrTQjQAVnpH
	 BJ/L64eo/6IyMcffKvO8Ewcdt0PxjXDknoj9Waxlk+YNi9HbxabUvz94AI7Uh/Q2nw
	 k+uAwa+VU3/nkKIiJ1s0XMyuVkew6sI3Y6v8oPKyhM9a5Pco0Y+ef4x+B3XMhdlNlQ
	 rmJb9lqBFiH1xd+Tx5aEKPKCK4Nc/GREVndzeN117qo4v7GxTA0+mqPAeww3j1TVWa
	 XBxIzXWfMs+Z7cJqr5iFuw2dqDzVvFRybbHW0l7vMacU/KyMus14VkOW9nWfJGTygp
	 MBf0CaGG0YG2A==
Message-ID: <eec6e8b9-f39f-425a-4217-9c15b52600af@kernel.org>
Date: Wed, 21 Sep 2022 11:17:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 0/3] Add watchdog support for MT8188 Soc
Content-Language: en-US
To: Runyang Chen <Runyang.Chen@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220920105622.25666-1-Runyang.Chen@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220920105622.25666-1-Runyang.Chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_021730_595767_0D157530 
X-CRM114-Status: GOOD (  13.26  )
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

On 20/09/2022 12:56, Runyang Chen wrote:
> From: Runyang Chen <runyang.chen@mediatek.com>
> 
> Based on tag: next-20220919, linux-next/master
> 
> Refer to the discussion in the link:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220721014845.19044-2-allen-kh.cheng@mediatek.com/
> The other wdt compatible strings are unchanged.So, won't apply the
> series above
> 
> v3:
> Rebase on 6.0-rc5 and add reviewed-by and acked-by tag.

If you rebased in, then why do you keep Ccing different address than one
in scripts/get_maintainers.pl?

Best regards,
Krzysztof


