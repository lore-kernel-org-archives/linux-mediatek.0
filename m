Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD3FC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 00:49:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 607EA61179
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 00:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 607EA61179
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cebGfjn7PpfJk4VzH0eQEUYeVt+G2a4sTalb+ee1t0=; b=z3rHfxn6czOSG1
	/ZVoopo7FCDAGOA2MaIW9ksw51fXCNtaXhYRbaOozB/wLyR7SJvNcrgr6lKCf7QVpcXxe3ffBw0Bz
	rqY9Tm7fhJO6dYLvHQgCCXh071Xib/1WHPrtRbxt6bMS9VVpuXwp0O1afxYxaHl14jvtACFXHKuKy
	mZ8Dn1NwpTxdpkgka7TwxeTPLOcHizHW1VuARQacJSL0c7SukMp78yIDz7in9LoP5hdEIwe9Ic/FZ
	q2amQxURYjhXx9mrCqloIbG+unmf0eOTtbTE5UYnZBq0s/hbng33uBh5n5tZjcrOtvNRpoCYcyhIP
	Us7ybY8DvmT2Vr6srl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBo2i-00BAbd-Nc; Fri, 06 Aug 2021 00:48:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBo22-00BAMf-AH; Fri, 06 Aug 2021 00:48:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 796BD611AD;
 Fri,  6 Aug 2021 00:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628210894;
 bh=g0boiJUI20ohNR05gdJT6zHOQ29SdiPMy7CKsuLlabo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JLdAZEZcOVQU2akza7AgcDopjV0flIcNP7s+yFMeKDRdRMCJG9bncuM53MpLXu7IW
 KbPbETFGcH1CvfcxRr7uu+iOTGwa6c6EqRIhm0rgYNw4m0uApEtaU3KZGnVDj6YOZ5
 2VugzLVvZ+WHgmuKMKN3yQwW+YmUm+DYtPwArKbGpszM7av0y5xk+XW4iqjaM9MVAq
 zliaV5BpzJc6xVp1xfMrDbFA/UN0lO6puNotMwSrWqNia0N3UMzUMwi6lBZTcflM/t
 yKDa3JDRzatHofRuMzcKHPhMBWi4XauoR3N1IcHzmnHubsWIZcqqCi+aelH3OGsAjS
 tnZzOI9M1oVKw==
From: Mark Brown <broonie@kernel.org>
To: Mason Zhang <mason.zhang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 leilk.liu@mediatek.com, Mason Zhang <Mason.Zhang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] spi: modify set_cs_timing parameter
Date: Fri,  6 Aug 2021 01:47:45 +0100
Message-Id: <162821082762.19049.15691152650066711280.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210719091642.24633-1-mason.zhang@mediatek.com>
References: <20210719091642.24633-1-mason.zhang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_174814_430976_AFF09AF4 
X-CRM114-Status: UNSURE (   9.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 19 Jul 2021 17:16:43 +0800, Mason Zhang wrote:
> No need pass in spi_delay to set_cs_timing callback.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/3] spi: modify set_cs_timing parameter
      commit: 04e6bb0d6bb127bac929fb35edd2dd01613c9520

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
