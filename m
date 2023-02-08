Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B54BC05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 09:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgzCeVyRP2zbHb43KYlqrxVMpyEMui5BuTHVlWjz71k=; b=WythczHN52Y8IECg/zwDRc2L6m
	bE2TeOOwHV7gdGl3a1QFoikl+vQLVcj55oZk+BjrRpWYarLMHjvWrOerCjL7Ng+sLusoF685f+B0S
	npkfRUbDFtFSY5bgivgzn5TfhvsNz0a4W+k7nSQuGLKiUV+z7ijg91alHoxdQRjqZYiiPZmSz1vgy
	ja3jKX6jqld0f0HgUW7ZOXXqC80yBtFIQgIS5CorUL8ISyH6A8Wm4ZV8hpfXRCmnLjXeK2RISEr6D
	+1JJguNb1568LfJjUZLZcLk7pV8YHs+vGyiP4keCp9ToOktR331vCYnV3aO9EUhAIBgO0Tj+lFBAY
	qZ7BW6Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgtd-00EuZ7-7H; Wed, 08 Feb 2023 09:37:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgrO-00EtbY-4f
	for linux-mediatek@lists.infradead.org; Wed, 08 Feb 2023 09:35:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8378615B4;
	Wed,  8 Feb 2023 09:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A994EC433D2;
	Wed,  8 Feb 2023 09:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675848923;
	bh=cDj+e/iAbuL4RBaTZZQuNHpaXf2z0D7rnqFPZS2npV0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nirilJ4KH7sKLaby5eYSIiuoopXDReFcAF56JApJAb02jfNE7LhhpiLZcPJqJ9m/+
	 hmreppXlTdP6csSKWhhF7gSrsR2VckEd+4GfoUfSAkBOiHW4zT9Tk9gZhmJmKO/SQf
	 yU+aRpTw5fqSlLNPG/0rjmJbEQMuJ5IIKO87WmlIOFrWIrPRQvxfkwhikSPPuENilo
	 489mOb17ileItJOslkLx3UrGo/59woVhcDMEvyOonbIkfyPzhx8gWepPyGaEP2q2q7
	 TouDkM2EQD586WKj+clvaT04slTb5R/5pSt7VmxjFuEAVnwcF1e720pQCjK4TdMx12
	 8xrqg/IXcEB+w==
From: Kalle Valo <kvalo@kernel.org>
To: Deren Wu <deren.wu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Sean Wang <sean.wang@mediatek.com>,  Soul Huang <Soul.Huang@mediatek.com>,  YN Chen <YN.Chen@mediatek.com>,  Leon Yen <Leon.Yen@mediatek.com>,  Eric-SY Chang <Eric-SY.Chang@mediatek.com>,  KM Lin <km.lin@mediatek.com>,  Robin Chiu <robin.chiu@mediatek.com>,  CH Yeh <ch.yeh@mediatek.com>,  Posh Sun <posh.sun@mediatek.com>,  Stella Chang <Stella.Chang@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,  Ryder Lee <ryder.lee@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  linux-wireless <linux-wireless@vger.kernel.org>,  linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] wifi: mt76: support ww power config in dts node
References: <70b8acb74fef12b10a74501cccd20e0c12f3f134.1675348583.git.deren.wu@mediatek.com>
Date: Wed, 08 Feb 2023 11:35:14 +0200
In-Reply-To: <70b8acb74fef12b10a74501cccd20e0c12f3f134.1675348583.git.deren.wu@mediatek.com>
	(Deren Wu's message of "Thu, 2 Feb 2023 22:47:24 +0800")
Message-ID: <87cz6k7b59.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_013526_280731_AC3D58E7 
X-CRM114-Status: UNSURE (   8.13  )
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

Deren Wu <deren.wu@mediatek.com> writes:

> support new node for WW regulatory domain

The commit log doesn't really explain much. What does this patch do
exactly?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

