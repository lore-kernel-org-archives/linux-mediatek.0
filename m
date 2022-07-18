Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392BCC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 23:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWRL5xsc3Tjlc8QkWbPQnnCT5F2NLFXoURr7pvm/4ac=; b=xpiMlMfjRFSfA/ySbrM8dbkT+m
	5YBalS9bTc22ivspR4pslf6NVGj1817tU6+CtIbebqIUrLx82gfLluAHMS7GTUyU5BoMFoP3lXA8S
	8yAzSd8E3Y+olt7Kmd7j/OwPBNIWisN8vCR6zEHOFJHh/aRunWcrHGjtVPhK7ik86MLtpCsvHH4Hc
	c/TL/mrqFXQObTDtt+Mt+fmowkVzmYecskvgYGUB9K4e9l61HuEDz/W0pOQG5idKmsrPzPSCMOJBF
	d/Xyh8Mxz0uJTiyyRPtgsxheu1EWaWhMWEOcsal95Mn/WhqjVRBjMte+3JL/qk/bz0fIvdhBoHqRr
	RuKcQ1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDa1K-002c5j-If; Mon, 18 Jul 2022 23:19:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDa18-002brL-2K; Mon, 18 Jul 2022 23:19:11 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C29806601A63;
	Tue, 19 Jul 2022 00:19:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658186347;
	bh=XFPSYryFsHSm1snQkSKESjY+F9VagO1bDzS/jPV8Kjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ePGi/Hlb1QivZZC6HeuX/uO5OhvRK7VZ1BmohU8BErrd0yARRoKIdcJ5ZljQk+2d4
	 HENFjU1ZicKCHA17S7gnBRNAt5JVRuWxx3ukFtea/2U2w0TNEZvdiAMObOck/pkfIA
	 rmqgnSkF7GmQejHafbo3rs0APJyFsVIjaDYKC8HTi0sy4E6A0gcKxrd8nbUyge6ulG
	 wVVdesNqF36iSl4Vt3L2T67XdLoiNu7C55bJxld7OLu0I7wQs28gEFBzlINQpPAbQf
	 cVHqNyP1iftvWANL2W+DHxsHAq0oPICan9pMOygI/XiY7ThfImAVfFm5z/fJraOCZ1
	 Y5lcT69TQwURQ==
Date: Mon, 18 Jul 2022 19:19:03 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v3 4/5] arm64: dts: mt8192: Add display nodes
Message-ID: <20220718231903.bdrzoj6zxvlmba2x@notapiano>
References: <20220712114046.15574-1-allen-kh.cheng@mediatek.com>
 <20220712114046.15574-5-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220712114046.15574-5-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_161910_340674_6DB0AEFE 
X-CRM114-Status: UNSURE (   9.12  )
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

On Tue, Jul 12, 2022 at 07:40:45PM +0800, Allen-KH Cheng wrote:
> Add display nodes and gce info for mt8192 SoC.
> 
> GCE (Global Command Engine) properties to the display nodes in order to
> enable the usage of the CMDQ (Command Queue), which is required for
> operating the display.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

