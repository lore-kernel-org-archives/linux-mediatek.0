Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6EEC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 08:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZTfzHDKm79/5G/oPA+cL4CzPLP7fdTwCi7JT8Ds87s=; b=DwvaNiWf0La3nEFk7v7zNPi/pF
	wKCvuop6C+HkwKVwVFvBP3csyxDWe9wSb8eOvHToCrLJhezcWli8o6KS0sQMMK4AMbZNP++0JQDIe
	E03EtYAIexsydAtoA/GeQfqJcvQ/am8l+4w977RpHL1BmyWR2TJ2JG2sAVA6E5gJIHshNmy9+ViKt
	pIFle1II/cF6Ef+vmz4ikU1YOnKY9GECvYzkhX/sQxp02yqOFIM/hnmEppdudn1lGe26nMztgFwZX
	ZZkL6o2Hloua3NYgM1zcY9LYAKj6DKnlNclH2+CHxreo/GEFCroKFjAy7rTfQidQDGK8UxZaKb9y2
	QbgUhLVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGal-005keG-Fm; Fri, 15 Jul 2022 08:22:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGaQ-005kWi-RR; Fri, 15 Jul 2022 08:22:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F7EE6601A3F;
	Fri, 15 Jul 2022 09:22:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657873328;
	bh=sUZouS3lE1J14tvmlfvtX6XwZPGBxusKP+JBfQl5o+8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jl3Ep2702F1Hv+y/rgolfrFceblEiEI/XWHj03jg+HtkrHLPuIB2dR+MYJ1oBibzN
	 u14TtGUOyS4ev9oN28GqS87p6sAYnKuevWSxvFd4tksTHM3zP8BCoasDt29ysS5use
	 vEeKKR3RLuhc6hcfikfVL10JRgyLgiInE+zHmAIBx6lAXulc/1p/4+Apet4dES/LBU
	 gW89BP8q1GGK23snISdzk0lsfHxIhv1HPuPi6fxfv9i2IT7GkMHKxtDOnHCYzYpqlw
	 53BhUWo7AKElTegX7aQuJc8sXRhM9uVhKUXC6nYYpG1dbyzI0IhZ3u/uItMYp9jN90
	 6U9+fIMHS6Kwg==
Message-ID: <5c25eaa7-c578-258e-a2ec-ca4a72488e72@collabora.com>
Date: Fri, 15 Jul 2022 10:22:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 2/2] remoteproc: mediatek: Support MT8188 SCP
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220715051821.30707-1-tinghan.shen@mediatek.com>
 <20220715051821.30707-3-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220715051821.30707-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_012211_145196_20FBCF4D 
X-CRM114-Status: UNSURE (   8.15  )
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

Il 15/07/22 07:18, Tinghan Shen ha scritto:
> MT8188 SCP has two RISC-V cores and similar to MT8195 with some
> differences. The MT8188 SCP doesn't have the l1tcm and fix the
> DSP EMI issue on MT8195.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


