Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7040E77187
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2024 16:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hg8LybB2x5AFlcqXyxqGpp+etZfs9oO9/+n55oB9cPU=; b=UsRWtnaSTTYfv/kte6htsQ+sFp
	wyhBHba5sh7UZ3MCfWqPYwtn8Dlb8ypS2iTuAHNJXK1tClke6xETe9m5AdjtUTYENH4bJOuPehOyR
	Ew6lD8mLZzNV8k3DJ3lb2NMKcxQsqvUD8XcvjdHvp8AEDTCa0elwZ4O/mP4cHsOHWUito7nqkV7+E
	3ioYMxbbUJt5t7mQoYduxWfIAbbex/Xp4v73CCq9WUpZnxVdOd5xBsZn2oVAFukHOoL9N5Sb1ItnJ
	dpmMVfoOUHnL4cBRGrdHEXktNFbyz8UtRsXr8yaHVDr4Bm2He5wYMyfx8u82oluPmdk1FEPk9Qa74
	xJM8wkSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNxFf-0000000HECB-2bdZ;
	Wed, 18 Dec 2024 16:50:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNxFd-0000000HEBp-0LEH;
	Wed, 18 Dec 2024 16:50:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E63C2A426B5;
	Wed, 18 Dec 2024 16:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD982C4CECD;
	Wed, 18 Dec 2024 16:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734540619;
	bh=7+necGPxSGo7sMtURcZ9mr0EJGBKL6/Ke2PfFK9/UYo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bOdJ7aSIvMGvhWqdSvt9YcvP/9FVRUvb/N5+4/0bk6m3uUebuHuu1eAP1VehihuiW
	 nBoGMeZZaTorFNXpS3qRHEVsUQ2DMCRLAZzbjy/KgJrtWURMSX7+GGn5JsyiZo0CCF
	 HYqF7pIKWvI0qy//RNV7foJP5E8hdgcHsb+z4/x1ErnDHHtcCYK5Mk3zKbh0P/TzH/
	 z35oD28CrpW3EZGZtexUev4/VeXcu61OsJrZOQ8iGNrDUXVdEnAWuKUlYpGz65HEv3
	 DFzdhM+QC1pGw9AdbM9ngR5FXM/Mzuow6kuJK6gesSqEa861dgjMXwnydNKZaI6Ctt
	 P52X7QKOZsYRw==
From: Kalle Valo <kvalo@kernel.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: WangYuli <wangyuli@uniontech.com>,  <nbd@nbd.name>,
  <lorenzo@kernel.org>,  <ryder.lee@mediatek.com>,
  <shayne.chen@mediatek.com>,  <sean.wang@mediatek.com>,
  <matthias.bgg@gmail.com>,  <angelogioacchino.delregno@collabora.com>,
  <davem@davemloft.net>,  <andrew+netdev@lunn.ch>,  <edumazet@google.com>,
  <kuba@kernel.org>,  <pabeni@redhat.com>,  <alexander.deucher@amd.com>,
  <gregkh@linuxfoundation.org>,  <rodrigo.vivi@intel.com>,
  <linux-wireless@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-mediatek@lists.infradead.org>,  <raoxu@uniontech.com>,
  <guanwentao@uniontech.com>,  <zhanjun@uniontech.com>,
  <cug_yangyuancong@hotmail.com>,  <lorenzo.bianconi@redhat.com>,
  <kvalo@codeaurora.org>,  <sidhayn@gmail.com>,
  <lorenzo.bianconi83@gmail.com>,  <sgruszka@redhat.com>,
  <keescook@chromium.org>,  <markus.theil@tu-ilmenau.de>,
  <gustavoars@kernel.org>,  <stf_xl@wp.pl>,  <romain.perier@gmail.com>,
  <apais@linux.microsoft.com>,  <mrkiko.rs@gmail.com>,
  <oliver@neukum.org>,  <woojung.huh@microchip.com>,
  <helmut.schaa@googlemail.com>,  <mailhol.vincent@wanadoo.fr>,
  <dokyungs@yonsei.ac.kr>,  <deren.wu@mediatek.com>,
  <daniel@makrotopia.org>,  <sujuan.chen@mediatek.com>,
  <mikhail.v.gavrilov@gmail.com>,  <stern@rowland.harvard.edu>,
  <linux-usb@vger.kernel.org>,  <leitao@debian.org>,  <dsahern@kernel.org>,
  <weiwan@google.com>,  <netdev@vger.kernel.org>,  <horms@kernel.org>,
  <andrew@lunn.ch>,  <leit@fb.com>,  <wang.zhao@mediatek.com>,
  <chui-hao.chiu@mediatek.com>,  <lynxis@fe80.eu>,
  <mingyen.hsieh@mediatek.com>,  <yn.chen@mediatek.com>,
  <quan.zhou@mediatek.com>,  <dzm91@hust.edu.cn>,  <gch981213@gmail.com>,
  <git@qrsnap.io>,  <jiefeng_li@hust.edu.cn>,  <nelson.yu@mediatek.com>,
  <rong.yan@mediatek.com>,  <Bo.Jiao@mediatek.com>,
  <StanleyYP.Wang@mediatek.com>
Subject: Re: [RESEND. PATCH] mt76: mt76u_vendor_request: Do not print error
 messages when -EPROTO
References: <1E6ABDEA91ADAB1A+20241218090833.140045-1-wangyuli@uniontech.com>
	<a2bbdfb4-19ed-461e-a14b-e91a5636cc77@intel.com>
Date: Wed, 18 Dec 2024 18:50:05 +0200
In-Reply-To: <a2bbdfb4-19ed-461e-a14b-e91a5636cc77@intel.com> (Alexander
	Lobakin's message of "Wed, 18 Dec 2024 17:10:53 +0100")
Message-ID: <875xnhrl4y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_085021_243092_D90FD567 
X-CRM114-Status: UNSURE (   8.91  )
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

Alexander Lobakin <aleksander.lobakin@intel.com> writes:

> From: Wangyuli <wangyuli@uniontech.com>
> Date: Wed, 18 Dec 2024 17:08:33 +0800
>
>> [RESEND. PATCH] mt76: mt76u_vendor_request: Do not print error messages when -EPROTO
>
> Is it a fix or an improvement?
> You need to specify the target tree, either 'PATCH net' (fixes) or
> 'PATCH net-next' (improvements).

Actually this is a wireless driver so the options are either wireless
tree or Felix' tree (for -next). And please add 'wifi:' to subject.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

