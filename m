Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7341BCAC5A7
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 09:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HB2ztpM/z/1aet2izgjZbRQv4OgflrqUwLmuY+sf8sY=; b=syIlYj92lWrOPDSeS26sUZ3Y+g
	4TA1oe79RYKh/v+B80jF2rGd7JEjOsWgOvsKqsEloyPu14azRoRMJnKhDFfMz1x5jNUwXioS1Ij2Z
	sJAMKcdJsFXidMM7MK+f5rMZqcm30t3NWQ9mIZysoPeFsKXuI62rcW4oN/2czdDG1RCh5BQhdxqRY
	4BQ+Ge7wbhioK8hpKKLy9qmoDpbN1ZU9ZDxJoAltuTTSX0d4OYUQ6isLHA6bAOgqiJ07EMgxhWCnq
	tnMDv4FXPGQXTV9RhSWMi+bs2ZkP8eCkVPKyk5rYcGiUeJqRapMpdwq9ik9X890bfuIpuAESxhuVP
	rudauCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zjq-0000000CzYG-46QJ;
	Tue, 23 Sep 2025 09:55:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zjo-0000000CzXQ-3PTe;
	Tue, 23 Sep 2025 09:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758621306;
	bh=6jkoZaLgcRgIvyAKD9Sgrmlisy0AVP4pRawO5HYe6i4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ENxgqdB20Q6egxrLJ/jdK12CrtpBRvuAat1f/ggJa6qUan0LopthbwJZcEUEIldxH
	 Z+z24QYl5FDG+eLZMlpStEg8zJsONSfVc3AwsWl/bkPYIMtnj+0L8dht2s/XEABPmf
	 hKDoVwkLkkLkU2VxsD86oLgOv2irwXqKu67WmoZYDDoygxhObV7PJzNoq0qHuuKVUn
	 BkhiOgwB2oCqBNQuTNKY89DJ79AxAVehYMRFiRaxtxxwMTI+hsGnQ9kSyke3xPOnLz
	 HPLCc8/OptlYTzrvS6YGnAjm9f9Sz5PxzvFioH3VJxmkM9GFPDHJRliu3UEsSjlK1H
	 2WGmncA/N+s5A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E11BC17E0299;
	Tue, 23 Sep 2025 11:55:05 +0200 (CEST)
Message-ID: <2961fdbb-067a-4d03-a4fb-68ea54638724@collabora.com>
Date: Tue, 23 Sep 2025 11:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] memory: mtk-smi: Add mt8189 support
To: Zhengnan Chen <zhengnan.chen@mediatek.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250919081014.14100-1-zhengnan.chen@mediatek.com>
 <20250919081014.14100-3-zhengnan.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250919081014.14100-3-zhengnan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_025509_119517_BC3E3021 
X-CRM114-Status: UNSURE (   6.90  )
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

Il 19/09/25 10:09, Zhengnan Chen ha scritto:
> From: "zhengnan.chen" <zhengnan.chen@mediatek.com>
> 
> Add the necessary platform data and ostdl setting to enable support
> for mt8189 smi.
> 
> Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



