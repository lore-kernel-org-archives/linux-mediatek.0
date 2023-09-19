Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A4CCD54AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ML9aJq8u7NjlbsaSFBqFrGPov0ZGNjG9tJ5m4S8nWgE=; b=XXGMuPn5xrmPEh0Zef23lpQ538
	Tt6HVYfJN+6fLcpvN5YjLK1UXGRJdN22eJEXzdHgMm3Efif5umauEAl/N8OedBHhSpkqUyX3X3Jxz
	wU8bWrgzhoTK1AJG8AptI/spI5XR3iY8Y8S9a/7e/g+MJee8oU01zARw+jovFg4cpeh31VGbGuCT8
	iASnPS+SOReeqgvSZ2J1kcHp+QUyCVqXek+p7pdLLiVht6zH0olpYs+cuCrWGI218k6TxIn/K9n3i
	jsI0FIyynAc3tpd+XL+BTVXe5ML6TTZ0SsfABqGyXXdSw+5g5QRPOZk8wrL9IGlI2i6UF4yhUHzvD
	MMyCQUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWMr-00HO8z-1J;
	Tue, 19 Sep 2023 08:46:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWMn-00HO82-2s;
	Tue, 19 Sep 2023 08:45:59 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:b07:646b:e2:e4be:399f:af39:e0db])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6BA5B66057B6;
	Tue, 19 Sep 2023 09:45:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695113152;
	bh=I9ktfih0sa6jgd7LQe4oO4cl3jZWiRbZxvF64WAFJ64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RnSgsG0+DeUNMB3HhUK/2fjxJJ/to9uV0+mEMUbGxMgn5t2b+Jh3bS9wdQkSguM8l
	 ohclYn0BDKntkCsksU5VNp/OCyBcOUlJ2MPDv7MBUMD16oIKBPwNrILw+uvt444RH3
	 XQRnP47sg5J8VHIFkFttZycmSSIpx72Y8evt9ijx6gU3lg7EKxSXWKIFzNDCtYe+H1
	 ehb8qIyrmYO+LdfigxTeLaMFEHmVtBfmwx/TOx2mT66QKZ9depLeU79TUt7TqYkJ46
	 652Es9yZyca6ibAYkQSY6Gl/QyqyDdv/QUxJne9hUM77KVxC1o36VWQjpW7e/VvZmK
	 qMZJ1H6JNd23g==
From: Laura Nao <laura.nao@collabora.com>
To: mathieu.poirier@linaro.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
	andersson@kernel.org,
	angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	krzysztof.kozlowski+dt@linaro.org,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	tinghan.shen@mediatek.com
Subject: Re: [PATCH v17 00/14] Add support for MT8195 SCP 2nd core
Date: Tue, 19 Sep 2023 10:45:52 +0200
Message-Id: <20230919084552.260918-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <ZQj16b1NvkDlij+H@p14s>
References: <ZQj16b1NvkDlij+H@p14s>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_014558_059344_6B148385 
X-CRM114-Status: GOOD (  15.77  )
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

On 9/19/23 03:14, Mathieu Poirier wrote:
> On Mon, Sep 18, 2023 at 12:31:41PM +0200, Laura Nao wrote:
>>> Other than patch 2 and 14, I have applied this set.  The remaining patches will
>>> have to be resent to Matthias.
>>
>>> Thanks,
>>> Mathieu
>>
>> Hello,
>>
>> With patch 2 missing, the SCP is not probed correctly anymore on asurada (MT8192) and kukui (MT8183). The mtk-scp driver relies on the existence of the `cros-ec-rpmsg` node in the dt to determine if the SCP is single or multicore. Without patch 2 the driver wrongly assumes the SCP on MT8192 and MT8183 are multicore, leading to the following errors during initialization:
>>
>> 10696 04:33:59.126671  <3>[   15.465714] platform 10500000.scp:cros-ec: invalid resource (null)
>> 10697 04:33:59.142855  <3>[   15.478560] platform 10500000.scp:cros-ec: Failed to parse and map sram memory
>> 10698 04:33:59.149650  <3>[   15.486121] mtk-scp 10500000.scp: Failed to initialize core 0 rproc
>>
>> The issue was caught by KernelCI, complete logs can be found here:
>> - asurada: https://storage.kernelci.org/next/master/next-20230914/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt8192-asurada-spherion-r0.html
>> - kukui: https://storage.kernelci.org/next/master/next-20230914/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
>>
>> Reporting the issue so that patch 2 and 14 can be resent and merged soon.
>>
> 
> Apologies for the trouble here, the error is mine.
> 
> I have applied and pushed patch 02 - please confirm that things are working as
> expected now.  Matthias will need to either ack patch 14 or pick it up himself.
> 
> 

I confirm SCP is probed correctly on MT8192 (spherion) and MT8183 (juniper) on the remoteproc tree (for-next branch) now.
Thank you!


