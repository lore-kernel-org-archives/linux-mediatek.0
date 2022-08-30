Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD66ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 07:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLzPFsB6ZXJpBFA+B5hsIvdwKl9s6wzWx/OLxOkS6vI=; b=bhiK5ym5zA7u4bINoQIlpnqFl1
	RMTqWcJMNkz4AtQF+rNsJOwc9JUZlU9fZDlBycWUi/3+JLhkecS7acZ63d3YIRuU6FMJIPbtfvca2
	qCqs7Gf4uc3g5+9LgSSlYJDpfxHRA+q9ZtG7OqlNItYqfFCQtEpDzo0Vu/q+MPSlGM0FVlwnsUAK/
	Jrue771Ho+LL22iE9OvWBmfFIRGWZWMRbvbdfoNJX73c6cRln3qQy3iSthO4K+yXYLIfPn0cVm7bE
	7Hev33YRl8txf7Kwm9tmiKBK1A5544cHktX7uCqB7fGrPfbimriorC8tKaED0qXC8+Kkntk6+wt7i
	oUCBP1sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvYU-00EjWg-Dv; Tue, 30 Aug 2022 07:21:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvYA-00EjSc-Oc; Tue, 30 Aug 2022 07:20:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7B88B6601B73;
	Tue, 30 Aug 2022 08:20:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661844036;
	bh=UzmHNdmotVM3jM3ssmk0O3EgfrsDEmWpJq3KHdX97HI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d/+yNckIGcLBzpE2ZeBn5sYd1EPdpSk/bjsnT1Nq5qHbwat3MCutXgCGWRgboBtx0
	 RfQDrwYYqbpVC6i4XDyXeGwoG4oN9gLkuUBwSYnrbbRCx1OLll/ljar3GGeLxMm6mG
	 hrDWRwg5PoXxsmbVZKqmBqafEVCV3gC9MVqI5UYZp4BOKkKfe3jdBSMZJsE9MvRhll
	 KedsmixzvZX1Dbf+wTkl0HmR7UfmIAFqeTbddOp5z+6xiSMVmgv+kLxLpueVVZCcfP
	 0qSeMr+shkwiWltqgb+fyLtrvtF/NSqY28ko7CXz+aq1F12YouVdSWedZJQqpkYmlK
	 75XLggpd96qSg==
Message-ID: <5e3668af-8841-629c-0df2-8b272167ee19@collabora.com>
Date: Tue, 30 Aug 2022 09:20:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] soc: mediatek: mtk-svs: Explicitly include bitfield
 header
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220829204439.3748648-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220829204439.3748648-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_002043_028235_F6E2395B 
X-CRM114-Status: UNSURE (   8.94  )
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

Il 29/08/22 22:44, Nícolas F. R. A. Prado ha scritto:
> Commit a92438c5a30a ("soc: mediatek: mtk-svs: Use bitfield access macros
> where possible") introduced the use of FIELD_GET and FIELD_PREP macros,
> which are defined in the bitfield header. Add an explicit include for it
> so we're sure to have the symbols defined independently of the config.
> 
> Fixes: a92438c5a30a ("soc: mediatek: mtk-svs: Use bitfield access macros where possible")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


