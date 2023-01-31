Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D253C636CD
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 08:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rx3WkbxOq68OLy+r6n5rzVdfc6xjpd8uAHsXlzRTS6I=; b=uTDjkLrtQQt+68AAmtD73vznoK
	6an3ex/6H3o9ESZ0EOuAe0eTSkZoDryeA1JyjFByc6ft+vad9UYyNLccwzdH1Agyrr77HPXTDV84Y
	eZc9qrL36Ckz62My7GFYbP/0xIey7GaqT/xPoTZeXcS96+8doa4mWG2FAgljVTLy+im6GwLKC4Hck
	djxfmuGV2yk4/04afZBSiC/itJTiUtEkms3a3gfSJGFCkS/873QtzBj0cnK6MIfo7uJZgWskPpREK
	eiM25r7OdO8UjdhoXzsV/Qag+idBhogwCzONdJPa5uNGwxIS5k0sKCpKThHPVXBMG01dx6XGe9E3T
	iioUI/xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMm67-006kXN-Q4; Tue, 31 Jan 2023 08:34:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMm5t-006kPk-PB; Tue, 31 Jan 2023 08:34:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CCBC66602EB0;
	Tue, 31 Jan 2023 08:34:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675154060;
	bh=YTDwGwfBFzyh04yq9kd12N21xcMUH+2G62M5xvhtgB0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=glgiKDV6E0zqSLzJqfUv4HNPK/4i0B3hHYBXcog8fqUYMD82r07E0DTjXVwGaEdDW
	 CS1CfpfcK5a6OtbTivjP3gVimQLDHfVVnEEy78r3LL/wyWWZOq10JnvmfE7wVuzhdO
	 ryCXFiZvpWNR9xqCTZjOebZI80LOrh0EJ3qvcMrE5yukEmy96e2khU1V7uyPGIilsn
	 Z4vdsINZ3rZRZzNbA8xBuR0pkL0vdd5LklnIfs5i5A2dL9MrcM1cnh2oNqcIGzsDAc
	 OoxNcKRD8XdkukwEoYw/mTXjHVyeVO6kWfVKXEA9bFYJqRlcLmmYYV0e905HPTvbav
	 jOxONT4uTYDlA==
Message-ID: <34593781-1bef-10cb-0816-b2833e9d35ad@collabora.com>
Date: Tue, 31 Jan 2023 09:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/2] drm/panel: boe-tv101wum-nl6: Remove extra delay
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, thierry.reding@gmail.com, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1675130359-24459-1-git-send-email-xinlei.lee@mediatek.com>
 <1675130359-24459-2-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1675130359-24459-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_003421_993493_D34471D9 
X-CRM114-Status: UNSURE (   7.20  )
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

Il 31/01/23 02:59, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Reduce the delay after LCM reset by removing an extra delay in the
> initialization commands array. The required delay of at least 6ms after
> reset is guaranteed by boe_panel_prepare().
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



