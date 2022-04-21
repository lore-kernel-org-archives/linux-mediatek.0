Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A45C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 10:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9C13sxF4xNah2Ezg4iocGyMpgrOYP77qnMA/33It44=; b=ZVqg0gdvqamwgM
	V7H9IKDH1Rxy2yK5lPapNOytPsFw2oEfAh0RPBSSztPRsQW7S5AwdQdCRkKHgIedmytlSGlxHeGyi
	xXmoLbvBIQbWReky31VZ447i/M2aq1mfD+Ih6vZRnmKoBwOFWubHjnRqxpt3bXCl3+IWc16Es2ANm
	+8vp0y9qaAMhQqI/LvFEYYQjx3uoNd+N6OYnjwF3eyex1dIUm6s7ojMiOJlmON7/pLhwMk/cytsob
	HGcifkE5eqhj4qpyyR9Dah8vFtVDJbYmItfCKNPFj1+2JQHbVL3nYqiwFp1dpTwiVZQZYWGd0SH0Z
	hyLCpVBAHF7n3KVUy1lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhTnV-00CypJ-Mk; Thu, 21 Apr 2022 10:12:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhTnG-00CyjY-Pm; Thu, 21 Apr 2022 10:12:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8AA9D1F45483
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650535927;
 bh=HPOrpLDJ/NYqVSsQ+sZ4XQLCeAYBNHE6ulTq2mIsJDc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W98B6+rtp16cuw3lgkpd6JA8YrUWyrDUDS+Mj/UxJ4GP+7oFd1sUbklJ1QDBiTAzm
 m2ci2dmyJYPHDvtIi6kMUq1Yy/BbCjMFaw65IRUHQftiQg/CRO1TOmFumOWsSScKbc
 fRJ9MfHo8bUZVC6NYFcWTgJbL+1frzxj/7wSgPSwob60ulGk1S1a8gzf2lzuh0jbzm
 ve+52G2dyd8CeD0qfv2zlWcbbhoZimNrS9C3a7In65nuGZetHNhf/oOBSl2dzw3Ji/
 5/omW4tgdBxeR/U6ccdShnlc8/RaYJpJ9WgKpkfYgEac1zD7PAKEB5ANIEKhfYBKSB
 Dwj2BuYcCicqg==
Message-ID: <2703f3de-1ee9-36ca-4866-89398c501244@collabora.com>
Date: Thu, 21 Apr 2022 12:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/2] remoteproc: mediatek: allow reading firmware-name
 from DT
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
References: <20220419123331.14377-1-allen-kh.cheng@mediatek.com>
 <20220419123331.14377-3-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220419123331.14377-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_031211_104591_E681B7E1 
X-CRM114-Status: GOOD (  11.06  )
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

Il 19/04/22 14:33, Allen-KH Cheng ha scritto:
> The SCP firmware blob differs between platforms and SoCs. We add
> support in the SCP driver for reading the path of firmware file from
> DT in order to allow these files to live in a generic file system
> (or linux-firmware).
> 
> The firmware-name property is optional and the code falls back to the
> old filename if the property isn't present.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
