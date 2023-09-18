Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEE7C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KDYv9YNxwsG2qaqZR8SJMZf7irA9htHdUFVCJaYWFs=; b=S3uXa4ihbIbGfYp6tlYrUx9azC
	SByfFGO0H7HEZWAX+F4LkgY//l9/N13LKRtQXxnKyVoQ3w0SW+y0jw53W+hnM4QR4Yr4yItRwf7ts
	YFfXoh8j602j75WFEPjEYnyGBabV8GWZtQ851C+XgfasJCkw8yWuvLxxsxyUqPiCl2QvB7SacNXnU
	dNJksTUiWTkA5/FRvaxet0wFYJh6GqlZRvbMxByWDIiluDUTFuSmV7uwoZnz+/8H6spfvsTLCg66N
	nelO9su8sDOEuakISsaM+FhrQ1HtElOhAKYTtTWTC0GCeApxzTAzE2EKWvXeMlVS1rMSrsO/pNBBs
	Gpgu3j6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBYS-00F9bw-10;
	Mon, 18 Sep 2023 10:32:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBYO-00F9Ve-0P;
	Mon, 18 Sep 2023 10:32:33 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:b07:646b:e2:e4be:399f:af39:e0db])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9038D6607079;
	Mon, 18 Sep 2023 11:32:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695033148;
	bh=Uc7V1QnED3jqO7q91bCXab1gBM9VqY9HU30Ul0mVYpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JzoSEqsNwon3ssPk59x0nv4g1mS0wowA87TrL3zpgUt5sR/z4pW+qKcP3YEAQ2N9B
	 oLPelEgZ/EonnxadFgXEwzAoS/sCA1C3sT+vpR/mgqB/FyjsNHA9M3XOH8WiEaOu+H
	 pwBA7rc7hDe8CKTTqloT2LUtAP59Mc1EEzncYp3tkSP0IH34ttzLDFOyo7nrNUf+ir
	 8nAToLSw9zfHPQ+Lr3cn2rrEBHzohp0KeIqwtGHhLjrlWvyQzrZMcZPAKJZzJHGbgo
	 +JLWocaKSPU7V1h52+BxdugDC8bw8WJ+MTEQEGem2v5A3yDWGaEMD33q57oOIMYYW7
	 K6xx4Hb5u4sEw==
From: Laura Nao <laura.nao@collabora.com>
To: mathieu.poirier@linaro.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
	andersson@kernel.org,
	angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	tinghan.shen@mediatek.com,
	kernel@collabora.com
Subject: Re: [PATCH v17 00/14] Add support for MT8195 SCP 2nd core
Date: Mon, 18 Sep 2023 12:31:41 +0200
Message-Id: <20230918103141.126271-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <ZQH2dG+l/dONUsyi@p14s>
References: <ZQH2dG+l/dONUsyi@p14s>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_033232_323602_CD0D6FF0 
X-CRM114-Status: UNSURE (   9.03  )
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

> Other than patch 2 and 14, I have applied this set.  The remaining patches will
> have to be resent to Matthias.

> Thanks,
> Mathieu

Hello,

With patch 2 missing, the SCP is not probed correctly anymore on asurada (MT8192) and kukui (MT8183). The mtk-scp driver relies on the existence of the `cros-ec-rpmsg` node in the dt to determine if the SCP is single or multicore. Without patch 2 the driver wrongly assumes the SCP on MT8192 and MT8183 are multicore, leading to the following errors during initialization:   

10696 04:33:59.126671  <3>[   15.465714] platform 10500000.scp:cros-ec: invalid resource (null)
10697 04:33:59.142855  <3>[   15.478560] platform 10500000.scp:cros-ec: Failed to parse and map sram memory
10698 04:33:59.149650  <3>[   15.486121] mtk-scp 10500000.scp: Failed to initialize core 0 rproc

The issue was caught by KernelCI, complete logs can be found here:
- asurada: https://storage.kernelci.org/next/master/next-20230914/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt8192-asurada-spherion-r0.html
- kukui: https://storage.kernelci.org/next/master/next-20230914/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html

Reporting the issue so that patch 2 and 14 can be resent and merged soon.

Best,

Laura


