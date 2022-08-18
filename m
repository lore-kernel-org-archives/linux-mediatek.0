Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AB6C28B2B
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 20:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deePQN5bQTbNF4XXXJJs2FSyOiIqggrUQb3mFevPtXU=; b=ubVnWDjINZxmBkQTR95j4qgzk2
	jAQIR6EGwuIPs+MtxI4qIXLcimFiBvWb4UzSgkjGazTOjUa2COTSlC8t8NhuKByPKWNtReJKI4iBh
	t+pIKYqlPgillT54NGR3TWo5H1hFXmyOQPhFiNrjDumvmPOwO3Oj6OsN7hiL3qjnh6e1RqVBgWMmj
	B5oUNVb/mTCNcYOSU4WshE+kZW9q/wtfIJiEpOaUDDpr44vEXxYoxxjjiMK/TinscxEnAm3pq445/
	q69c7WyU5YAmvbSCekAbBZqc5Bvm5UQySDBOCqWnlY6VW6SGYdoIEZyaQ2CgFHMl19TUqp3hEArB2
	KdlqZyMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOmMF-009N6C-J6; Thu, 18 Aug 2022 20:43:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOmLh-009Mba-Qs; Thu, 18 Aug 2022 20:42:43 +0000
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DBE626601BF4;
	Thu, 18 Aug 2022 21:42:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660855357;
	bh=D7Xxxq2ivM89ftLoZFcKndJliveYXABeKvga5jeIPxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fn/n1YBEsHBcu+LaJsjFsogd/ABNi3DMfgFN131nKkah3nhbwwNPXWIJRNXQmPWQc
	 QI7NxHqEz4NyyCwsmZT2QS2t/kPI6BsTyznD1SReSwnehkgg02CHT+Wk6YctN0D594
	 iR68Wtm20Wb3TW4BA9pfXWr5V1rVGOfO6oSD+Y28nIHpdq0RBC81qRMksa/MA6mPcO
	 SZfvev3HUHczAAVJH763JL7VNi5fZBrFhGR5e8VtkrSPp8cTjjWbCVKRjJ8KVcdfyw
	 nrmVxwyWPErx1FknD8YmKHkJmnHtch7rQLY+olK/OhJMeoDtziOurhObeWJj9SB6mQ
	 +xBtvs2WQe/zA==
Date: Thu, 18 Aug 2022 16:42:31 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux@roeck-us.net, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev, singo.chang@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v25 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
Message-ID: <20220818204231.zvq6tipjyzen33oi@notapiano>
References: <20220804072827.22383-1-nancy.lin@mediatek.com>
 <20220804072827.22383-2-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220804072827.22383-2-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_134242_020273_922C333D 
X-CRM114-Status: UNSURE (   8.22  )
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

Hi Nancy,

On Thu, Aug 04, 2022 at 03:28:21PM +0800, Nancy.Lin wrote:
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno
>  <angelogioacchino.delregno@collabora.com>

Some line-wrapping happened to your patch when sending, so it's corrupted and
won't apply:

	$ b4 am https://lore.kernel.org/all/20220804072827.22383-1-nancy.lin@mediatek.com/
	$ git am ./v25_20220804_nancy_lin_add_mediatek_soc_drm_vdosys1_support_for_mt8195.mbx
	Applying: dt-bindings: mediatek: add ethdr definition for mt8195
	error: corrupt patch at line 228

Fix whatever causes this in your setup and re-send. Tinghan also had this issue
recently [1].

[1] https://lore.kernel.org/all/96e66425-ff2a-4640-8b96-48fa39943bf9@linaro.org/

Thanks,
Nícolas

