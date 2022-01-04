Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA0BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 15:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmGu9wpCgGj1jHUAs+OtskvnjnG1sS1sgTEO6frE6cA=; b=KOg2IYQXAyCOWF3WVVj5+RHVRN
	kHBquwXwdDuCOWLrfawjtczSUqyvHMi7FnJoFEX/Ql88bH94BwkOtJ8XKESzHhoHD9m7pfg6ybwTp
	ee8yBHw4DNEMwxT5C2JkvacUccVeN+wjln9gUXy/DpSXIFqVGXFEHah0rkZFSrm+sj9/B2MykeVD5
	/b9C3k/p7QNLyQ070tcIojlnEXH/+rg2bHzqbD1DlDF8uYArXhNnmf5dR9MVahMLM8EFaoa0PbfEO
	lOgitszYxaE6f2n7g4YNrftDzqLAgHN1kl0n3qzoOmYAXdSYHL0ArArOHHADsu86i1+KXQAkGmxWy
	5gsdzykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mCk-00C6o3-Fq; Tue, 04 Jan 2022 15:58:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m9A-00C4NR-P9; Tue, 04 Jan 2022 15:54:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 77F4B1F43596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311687;
 bh=+EjaNGSwAWDlrlXS6ayy7mmIq1DUC6VaOMAwEnZbCLE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KXuioa6ya/0l9ax/FeyYfJTwPxq/3r/sBYqSNJDamQaA2jw0qbhkj7UY+6uTPN+Q4
 O57SNua103TYclQYgq1jRWU1xr5O+baJHQ9d+weMkvd3ndaLbhc+u3v4o2RyodMO8I
 N+WNXuhZpba5gvgEFUvuRHTA9ac20FXrk6/rJ9gHZn756OFisCcm412RVyjWTvBK9a
 QG6CCurHxygPf0KYzjPlfA94AdFr0wujLWht/+b6XEZmeajQKeEdd93Nrs9IOKxyPM
 isCwux/qfdr6wgeBY9PtpVu8r5t4w3DOpfXNwBoHL0QxknpLH1B2V0KpvA7LI0aVvX
 R67ygosdoQW2g==
Subject: Re: [PATCH v3 11/33] iommu/mediatek: Remove the granule in the tlb
 flush
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, chao.hao@mediatek.com,
 yen-chang.chen@mediatek.com
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-12-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <428bbee6-d680-6188-9961-f13f64cc7c40@collabora.com>
Date: Tue, 4 Jan 2022 16:54:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-12-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075449_019420_6BBEB450 
X-CRM114-Status: UNSURE (   9.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/09/21 13:58, Yong Wu ha scritto:
> The MediaTek IOMMU don't care about granule when tlb flushing.
> Remove this variable.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
