Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66231C6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzcXTd++Lu8JmUDMf8VBmsu0dBluI5Jiw8FW+H28shE=; b=OaOKRkkUXEdVO5XTOypsYslKx2
	a+8yytoLPgZTHipilelbriaBTMamITvoe/zdq2Go22KD/xmh8teo7dt4gyhVzLT7xfzHxZZzbCjC0
	ISDEbPSoDzpn46vxfh6MOvj3D1wclERWPrCoVj02dVUNenb53Zsm61opinfBGHifwgNsJooEeobo9
	c7+7dt3NfEaPkUcM3/ksbyDDF7W6w+2Ix997L5tzXnxcbaWGKr07+yxz2dvwn7+SLcAlJtAIhCU62
	EjeJxgFz6RmPw86S9jXFfMfrveBzjfWw6pt/Vvz9rKD//HMA6iV1Dbtbakk2PhakBM62+BQKpLcDF
	JaksWL3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBTx-006oES-0o;
	Fri, 31 Mar 2023 09:55:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSR-006nPR-10;
	Fri, 31 Mar 2023 09:54:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A6196603193;
	Fri, 31 Mar 2023 10:54:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256446;
	bh=IarGogse4Y+RWB+zvh2pQ1pzR4Yc9/24eKDYTito9nk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XX04hJgzL5flXafpU8G4hjKVA/Mw7TlMn8eGrHCwgGnumJg9DJTOkhUptHEG/ajDs
	 JFuYvyIu3X3lfAVU+LSvkxY0tc71mln9Xa8S6+s3WkZXkxzIvwTAPAXto4hG4p8Dhj
	 p7+CsT8m2XKK6qnShDRbPQP/uq06a94rMR0sRtU9i1J4iTQ1LDpZHjw2ByqDgb03ni
	 MRQGzHNSm+TM57kFOrO0zfboaFrc6+lmSHElxAZcOTaG1L5sz0jGzmx8Qaa8zMHoV1
	 JYsrJnhfEo20hB/huMU32Rt8hEr5o6/6OfOpVnZnenpxoc7jAAnDmsv3qxVsiniI2A
	 zFSc+uB1lyjuA==
Message-ID: <536915bb-1fa1-638d-2cac-65a4672b9728@collabora.com>
Date: Fri, 31 Mar 2023 11:54:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 04/19] clk: mediatek: Add MT8188 peripheral clock
 support
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
 <20230331082131.12517-5-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-5-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025407_488879_C017A541 
X-CRM114-Status: UNSURE (   7.89  )
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

Il 31/03/23 10:21, Garmin.Chang ha scritto:
> Add MT8188 peripheral clock controller which provides clock
> gate control for ethernet/flashif/pcie/ssusb.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



