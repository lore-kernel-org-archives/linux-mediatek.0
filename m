Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50ABC3271E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 19:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9AIMMkcFof/K7x3/cTKobMXsDXdJOFbUOYglQuMAzk=; b=Wej6ePv7PzANBaMHWScDYyXWar
	R8JfEKMlvoFSnCzSNRtXN+I+htS9P/QQ8sOMI1+Gxks5att+sMb1KG3o+FA1upCTboCcGH1hCRoGK
	lhOchL7O/Mwr+iJzSFMFkqtB51jwuLvdY7Y82Dw7mjk2jPhG5QXtB9xTPjim8L5KA/YZ7wlz6Hljw
	Y589bl3z0W781QVKRSEOqaCDytG2/8xcI82hWF8nMd7e0HpQ7DG5c4ooCFo/dRhG+wFGBaSS4u2k1
	QEmpRhAcqja5G/AF/fwCG4vwLBayGhWyszBHSUWLDHyB17yehs2rbjgPOF9/egErr6xhFGgUU6yAa
	LnwjzpKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQuEx-00000004rGr-48pm;
	Mon, 08 Jul 2024 19:41:35 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQuEh-00000004rCN-1oSV;
	Mon, 08 Jul 2024 19:41:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720467677;
	bh=dOch4uHVwbdqhpbBV02MHHp9f3drQ4HsNxri8gTA2+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=4psoOl1pmK2PjRg2Yhg6judHKiY5A5m4nLsOe9zY58Y3C/syatG5SCwMXB6RQ3uvM
	 lmgEXXcXBsWBhM/vmMloatC5WI5vqDX9+dDtq/GxjwNvhcxHfI7Ah7lr6AB8AhzPSP
	 K75lTFKgxYPjcVdOINjCzMFdFR+gfzg5OoS3j6bu2EKhlrl5LsA1WAvpYcQqlJRlyl
	 J/2ySoNymxM3VaKtdId92aeeonAmIC8OXeogoyj7CQzmJM4qd2OU/DL6xF2Dgks1V5
	 sZFyhpGq71ep/BTjn9aYOB/9u3UlTKZXoMr84W5bXsktvdrlfHd0s/CToP0/oPSuGK
	 DFv7OMe13+xPA==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2CAD0378042B;
	Mon,  8 Jul 2024 19:41:14 +0000 (UTC)
Date: Mon, 8 Jul 2024 15:41:13 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] nvmem: mtk-efuse: Only register socinfo device if needed
 cells are there
Message-ID: <09652279-4148-4db2-b4d9-ef2393f1b0b8@notapiano>
References: <20240708-mtk-socinfo-no-data-probe-err-v1-1-fb2acd3a47bf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708-mtk-socinfo-no-data-probe-err-v1-1-fb2acd3a47bf@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_124119_777196_43A92159 
X-CRM114-Status: GOOD (  11.45  )
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

On Mon, Jul 08, 2024 at 03:35:42PM -0400, Nícolas F. R. A. Prado wrote:
> Not every efuse region has cells storing SoC information. Only register
> an socinfo device if the required cells are present.
> 
> This prevents the pointless process of creating an socinfo device,
> probing it with the socinfo driver only to ultimately error out like so
> 
>   mtk-socinfo mtk-socinfo.0.auto: error -ENOENT: Failed to get socinfo data
>   mtk-socinfo mtk-socinfo.0.auto: probe with driver mtk-socinfo failed with error -2
> 
> This issue is observed on the mt8183-kukui-jacuzzi-juniper-sku16
> platform, which has two efuse regions, but only one of them contains the
> SoC data.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Sorry, there's an include missing in this patch. I'll send v2 with it added
right away.

Thanks,
Nícolas

