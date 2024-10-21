Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A334D15D95
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCmeqNYYpC3yHaNirXoNp1nTZD9jkpXPS86Fod4KVP0=; b=EJU+P+Ah9TLkp4n+DGbbuR6Amd
	fJ+/Wj2oBZnz1WEKBjRD9x/58+o66VcOsDQkRwykLUC52bj0CCtXw7gP2yn6iLGB+z2/3Ez/+YHvi
	rlKfThfiiXiaoNf/9UmpZHzALiaYfnDMHcSazQpTEGtK7uetYsDtJAnYW+8oGGojEO52zkVR2v+fq
	Vsg9rg4evAZf7kEvS8Zk++KYw6JQrPvp/zdlBogeYH2KGuvqam71BD9Jl4u9NReT1TyvMOVR4g99b
	3HRyrv/nNOqJWNdcShajWHu7b9TITt1+eUVzsNn5Rc+ghKELHh6C8/cRGV3wI0K2K28gbtQhqJPKk
	rKQTki9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sjZ-00000007Tn2-1uYZ;
	Mon, 21 Oct 2024 13:46:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sR2-00000007Px1-44cE;
	Mon, 21 Oct 2024 13:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729517219;
	bh=mTIoVtYVIb9LlICU5RHcqT1i6f0rLph2WFVJzpdQiZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lc3Zgqu7X/SsLog0UfF+/eTEoJKPIj+GB2GL2oy6/oIUToR0qwGnCWBqM0frfHDWD
	 1NjRG/lj0rJKiCjzXVebXWzfPF+f2nCTAnXd81yOkDlDIOLJVfu2YCbpNXVuvhXGoZ
	 gXbSpoScmsSvvxiYUJRPDmclITjcrmuOKsT+2i2tqOtZgF8Dw/seuuWVR3ldafDvw+
	 XGVmR0WiGBACvrQmih+7+Tk4rKsuDhYqYY4AT0FXj7h5EfArVyP6ce/BLs8EdcIRsX
	 gjOnpwS9XQKiKpfXsLJ1/VRMmnGWJSOIQep+NUGHL2Psr7pLpNhdh5ASlkodeQ360o
	 ZMMzt/aB8/sAQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2021217E10AC;
	Mon, 21 Oct 2024 15:26:59 +0200 (CEST)
Message-ID: <93dbd4e5-6cd9-435d-962d-b6c261df899c@collabora.com>
Date: Mon, 21 Oct 2024 15:26:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8173-elm-hana: Add vdd-supply
 to second source trackpad
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241018082001.1296963-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241018082001.1296963-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_062701_215597_716C623F 
X-CRM114-Status: GOOD (  10.24  )
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

Il 18/10/24 10:20, Chen-Yu Tsai ha scritto:
> The Hana device has a second source option trackpad, but it is missing
> its regulator supply. It only works because the regulator is marked as
> always-on.
> 
> Add the regulator supply, but leave out the post-power-on delay. Instead,
> document the post-power-on delay along with the reason for not adding
> it in a comment.
> 
> Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



