Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D82C6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 08:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVI0mZbqzT/Ckkl04W0D4a9aqD8UpYhdbO+RuUtsc5c=; b=OhS4cY4vRSquJfxXiPkJdCRM93
	B8wBuj7yxhLcTo5RdwTORz+54CePtJQPE86q5sqwyCeMwcUpVeJ8BISkSH8ISV2KqPL6+s76QrnRL
	LgcqQGygtNChx1D0RvRCl2nAJxyC903NdqEaNB8YeoUWmyeTAu6Rmi4qPVQvEQdTre3SFfaZ3At+h
	2kgxuLtQ3UeY/teK4eE8Xzg/0zcjFd2n0FLZq5pvA4Bvnu2nCJ2N5RfgvtH03pKCNmGfJGPtoKkDj
	O3c/ExFZTUQ10X9fOVuG/RiIivHE1UwDzCxYgltLYv0v6l19x35eguoLMToW1He9GG8uC0ZoyivNR
	bzBT/BWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbdld-004o8j-Cz; Mon, 13 Mar 2023 08:42:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbdlR-004o4H-MI; Mon, 13 Mar 2023 08:42:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AF4D7660217C;
	Mon, 13 Mar 2023 08:42:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678696956;
	bh=x8wzIUy9Cxdue6iWvChHsFFMMVEqwwyF7up4rDSFcMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TN6d9OgE3CSyCBCidca1xh1FvLRtPL6Oz0dwlmYp1XdhnIH0JQDKo7PFF4U/HBbpX
	 /Zni4fexbWaSweqJcsaz9CkH1OsLZD2bdat8jYyeBQyByljx32uZ8slDDBNvcipSfj
	 pBnkCy1LCf2pMHIm0xV4bzkQi9lNojAUAGxYVH0YSiVmIO+6MAg9EEnAO5kKCx9toB
	 aatokoXdNshIHtm37DcR1BwY9XJ7KV0XN2AK7PU4vK1z0PA0MWsHmcOBxNr59Lk3KJ
	 NvcCaWYx6pvl8ehmg3wrMLth0dIOjEcYt5eA831uAGjiv/AoXo9D0AalFZ8MYcFdTV
	 bOx+tNoIoz6BQ==
Message-ID: <d27d813d-60be-a67b-8eb3-44b50e490794@collabora.com>
Date: Mon, 13 Mar 2023 09:42:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: Use of_property_present() for testing DT property
 presence
To: Rob Herring <robh@kernel.org>, Bin Liu <bin.liu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230310144711.1543225-1-robh@kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230310144711.1543225-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_014241_980952_9FC354F6 
X-CRM114-Status: UNSURE (   9.51  )
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

Il 10/03/23 15:47, Rob Herring ha scritto:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

For MTK JPEG, MTK vcodec

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com


