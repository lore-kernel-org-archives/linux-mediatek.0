Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAE0C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9RsOrzIUhQYR6UYQ2Q9u5tTDJiwngg1ip3OF0zyRyo=; b=addVA/rX1BNahO+Kvr5LLCYOwm
	siQJiuJFiWKjqY8OntBO8cnAhFOq6m+K1zeZpICQ+NvxNlBzh/FH4curl5uJhcwanR3PYygsxptLk
	g0+R9llCPjHl3tyZOJuh6ey/hZ9KvwF2KkEEWvCeqgBcCwo131jlBYGI7IQyWXcFkUE5YDhv24zsC
	z9QT7ydkkQ/oFHpBvHZ4JtB/pyVmOYYLAtS39uKM0MmC8XxJ10P2WGwycSnWofLoCVEngXih2TPav
	xbeJt7j/xN1jbhFFobh0jT5n1zZzeO+yE6zb7pZlo1t4Xd7p4I+F+QltGtiU9kgysaSyZ0pDKikNg
	jHMdBBdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6G1-001hsR-2t;
	Fri, 17 Mar 2023 09:20:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6Fy-001hr7-1H;
	Fri, 17 Mar 2023 09:20:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A2E1B660309F;
	Fri, 17 Mar 2023 09:20:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679044813;
	bh=qN3K0KSRIMQUiSrpkYSzcME03jxUWUJUqnODTeKfW1c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nu/UW1M193uEvtJO0hJ/riNAZ1gjo3Gua7wTxaxHzTvro0CvquJLLVgWZMmzg85hI
	 IF4zE6GcRDZnMTc4yv1NAYYCw60tIdA7YGWtbbwSxGKF/o5Te5BPTGb4Bt1jA7ra9G
	 7F41iEGgvvvWrXvoeOpT5sktcG2Q5SANuC9FsditVA8kcINHdQJ2SZobSfIDux60Qv
	 D2lTIjFlPjwE9LLLqb0OdbWRvk91c06Lz/kM47mh3a1sXyDQXiK1JdZP8DkLhp4TO/
	 6oKK6q68hvKORvgi8wc1nb0BBlY4+IS0AGTz+8OYiQib0JNfAU6Q0JyzL/oq+uA1h8
	 zCCMzZIywJm1A==
Message-ID: <5f109541-ecde-bcb4-ae55-93444d800899@collabora.com>
Date: Fri, 17 Mar 2023 10:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] arm64: dts: mediatek: Add cpufreq nodes for MT8192
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230317061944.15434-1-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230317061944.15434-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_022014_565205_3171F41B 
X-CRM114-Status: UNSURE (   7.19  )
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

Il 17/03/23 07:19, Allen-KH Cheng ha scritto:
> Add the cpufreq nodes for MT8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

On Asurada-Spherion Chromebook:
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


