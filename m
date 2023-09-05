Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7AACA0FE9
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 07:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Srp12jZ2l/FJg5/koZs+VRDwTeBxd3uTZierhrBjiZs=; b=3R4Cit/GR6F0vNG1SxjvFu04eK
	vU80fXMSyi5lLlRBH0oGtQfdb0NS9uAbv+LC5l1LJsxfiYLQdcKN0xa0exFwonbS2XY9HbErIDgs4
	zkNOpWneeusUEaBY5ms3Qo43MaBMebRgXkjMV1EomfjYzOaH3IkFrhf1nSnjnLESykX+8cooewNXu
	DjztGsXiIjuSLRcwBj68DUVNGfSJj2ORaGya0zxpyV+0s83gUrutB4hlX/+o4fQw9tLjlA0bbwqc7
	UDWNKW9fmYmjponfv4aOs8+toWaUpnbP/IcOD85eLfvt8yj6pzlqlj2dDS0nntYHzs/ciI2CTp/+C
	YpHeX3Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQlu-005SnK-0U;
	Tue, 05 Sep 2023 07:46:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQlm-005Skk-2t;
	Tue, 05 Sep 2023 07:46:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ED57A6607186;
	Tue,  5 Sep 2023 08:46:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693900000;
	bh=LFndA3pFJkQjsY6+cZ6q8HLFNc/UGIg5dTqHJTKN0iQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pew4fawfy9voOOmE19XJUCsMQ72+myxp521f+lJ63NOtBo2sDHhpw1WiD5ScDG/zs
	 RAlBhLcc5u/n0z1qWxtO0VoIcOqn7qbGF8U9xyoitgRHwyVjjzHkWOiONElzrcYsKH
	 r1ozDXtuQat1zTsISxfeQdHPMOtbQgB54w2iE3PJWSXrioA4TlAonrN3jWoVPw2Npd
	 786Bt+/rd6ixLLF0SI1VMyTKVDzLFaCUKwu0QcysplvyIfPZ0Ru/Gl8H1mt3dm8w+b
	 DuJGIS1wxbXv11+2/iI74HguOcmAWoM6lTlu/NTzulIIKuB3/vzlfKaoflVPz93Qnx
	 Mru9XrTYYePrQ==
Message-ID: <cb1fc499-3649-0f3b-f9c0-f5305b2310d7@collabora.com>
Date: Tue, 5 Sep 2023 09:46:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v17 12/14] remoteproc: mediatek: Report watchdog crash to
 all cores
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230901080935.14571-1-tinghan.shen@mediatek.com>
 <20230901080935.14571-13-tinghan.shen@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230901080935.14571-13-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_004643_065800_08684A4A 
X-CRM114-Status: UNSURE (   7.97  )
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

Il 01/09/23 10:09, Tinghan Shen ha scritto:
> To ensure consistent behavior, the watchdog timeout handling of the
> multi-core SCP should reset the whole SCP sub-system when watchdog
> timeout. Triggering the rproc recovery flow on all instances will
> ensure proper recovery of the SCP sub-system.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



