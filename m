Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D23C83F3E
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 07:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZ2OvHk4DwGEXVVaiK8rZKJ/zvcdwFk9Ed+6332i5H8=; b=OAccumDo5MSk6RyHgaMAqNxRmJ
	mC6wcYsMg7dq5o/htWKUjcFr4gFZ3pdZgFdZdVYwusdptea8hcjw1cZK3UFcNC5mxllY6+bUmc+JC
	2AKniHCH65o6RB/Nyp09Wa8TbdU8DeBt8v7oUa2REKyV4om2ucAs2l73lZHFm4X3ST91lJBlqSHaf
	VP7PWCRd5YYxmuYZu+LU8DrjEcibTMPyNlN5n77pghxXFr8YuDuEVTgyYVqKaASpM55gv74/Ei02Q
	mTccVIFMTnly95hq2xTbOKGuLyRAC6y7VK4hdGeXC4qHQvFVElai7Dvllfoxu1B9YWuQ1ewRmhtRg
	TanyEi9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQlq-005SmA-0h;
	Tue, 05 Sep 2023 07:46:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQll-005Skj-1m;
	Tue, 05 Sep 2023 07:46:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0313D660716C;
	Tue,  5 Sep 2023 08:46:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693899999;
	bh=M7ijh1NV65ef/d85X0SUJPK+cCBA9TUb25WnmHtKT/U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GfmE4x/kxAwI40jVpWeIH0F7aLiEdbCqghvYyXiLpppjDHyEi5ja0gmPY8JMxrMN2
	 EKUPi3uWTwy7Ju8OX43emkXri2FELmHV60atHRcwTBZuNYh0mEk+EsoPH1Ny/mas50
	 GOLBBCH/paJW7d+w9PSqz9ylfh9/UPUeNOeBaqzChlt/QCRdu/k3JsVlbIKtcgXM3v
	 tsp+q5ccXPg4ojEGFdPY9hXfw3kPJM8C4l4tku6YOegCB6mbPFh8ccyeYlJmJeSEEx
	 6mrkq+4VI4Te6IYiQimQkn6V5qGIU/Brawaag7fCO8e+QYzHl9FF0kGKlpv+GsATzO
	 f1czlQN0/EVtQ==
Message-ID: <8f6390e4-690b-948c-f91b-f99768ba7cf0@collabora.com>
Date: Tue, 5 Sep 2023 09:46:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v17 09/14] remoteproc: mediatek: Remove dependency of
 MT8195 SCP L2TCM power control on dual-core SCP
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230901080935.14571-1-tinghan.shen@mediatek.com>
 <20230901080935.14571-10-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230901080935.14571-10-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_004641_734067_D409AE90 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 01/09/23 10:09, Tinghan Shen ha scritto:
> Previously, SCP core 0 controlled the power of L2TCM and dictated that
> SCP core 1 could only boot after SCP core 0. To address this constraint,
> extracted the power control flow of L2TCM and made it shared
> between both cores, enabling support for arbitrary boot order.
> 
> The flow for controlling L2TCM power has been incorporated into the
> mt8195_scp_before_load() and mt8195_scp_stop() APIs, which are
> respectively invoked during the rproc->ops->start() and
> rproc->ops->stop() operations. These APIs effectively serve the same
> purpose as the rproc prepare()/unprepare() APIs."
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



