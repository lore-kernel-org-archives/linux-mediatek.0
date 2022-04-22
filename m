Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F13C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 08:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCp2QTzzEUHjpnM0qTHvxBSsE3fvIIystTe4RVCan/U=; b=HxBGkKA4l8a6M1
	Ie5lZxEFSn/e9ONETvZrvZFkwuTHN94wRF1H38bE4D9uHgXXKWFGvwgS8+M48qawGG/JvXkqzknUG
	/Rb3dToU0tG1xBdSEvhApeGm516XgszfW5j2APBw//7gTtNSdhqkOehbyZ1Q3d9Ij90ZI5/BsjnHf
	Z5QfXlZW9ytrTcU+MRbYmbeJBC4ZFz9+3bu9bf7oOoi59qyoQPCp97yrJrHXeeFOCEiyZvaQXlpmX
	S/s3bOUXSLuifJHV7YfS+GT8HTxk7K0jBjKXBsNx5EDnAgOBnAmkFcqxmN7c0ivcxKQqnUXJzrKKZ
	UipgTaOq84SpwtsR8rYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhoS1-00HB2h-I5; Fri, 22 Apr 2022 08:15:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhoR6-00HAbR-6X; Fri, 22 Apr 2022 08:14:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5B8751F463D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650615277;
 bh=ybS44P9MMmakQWgzcRRe1GKjiCQ1Y7b4n1Sb0wQeP+U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VI1NBwBSfhyzngLnXnZOB7u77+EOStHd17W+lTDF8zVdfmZwJwba+cwmnvDf7yuUY
 X1JE9FQn8FXfQOyUhhekOt5ABbngj4sEwnmstSMuk+XSfzpCGqDKcjUJ/XPBsUN4+9
 luwRyVOtE738zh48axUJFbr32+pELyvoOchijHDcc0k09YfkZ/c7hiSyXyRESioYvL
 popckrnmZX/F/JF8ktgtn/MOUf65IWeMPPXM5lCA3wwbKxUSZ0gFBYOSoYVPUTwYpU
 CyVkMhZovNfISUmKOc9pCSqXjGR20nbgiiFGWBt0WxoAKIUHUTCl1UIWA+eCl3EbA7
 S3Y/FOoKRGGRg==
Message-ID: <612cb22e-7254-b19a-e6e4-6e737092a504@collabora.com>
Date: Fri, 22 Apr 2022 10:14:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Update entries to distinguish
 MediaTek PCIe controller
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20220422070908.14043-1-jianjun.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220422070908.14043-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_011440_429500_7FBF26CA 
X-CRM114-Status: UNSURE (   6.18  )
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

Il 22/04/22 09:09, Jianjun Wang ha scritto:
> Update driver entries in pcie-mediatek-gen3.c to distinguish the
> MediaTek PCIe controllers.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
