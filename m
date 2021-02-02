Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658CBC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 21:42:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1299964F64
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 21:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1299964F64
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2gLkfcU+iFqo9YnBo4pjDDh9MbahwjzuC9c3xin7prE=; b=f6xIrO0I20+wyn9NkZw6hQk0k
	Bhahg2SfOiULXDIsqy0rhhKQpqUqTKCxbFugmX0QPPlj7bP9hAkALCJnFx65aY/sTFRkpyXulGEYt
	Exky7J3Ms19tdjEeg0R4TYL45erf4/SNovZPVMwqWeTP2If/0hy2ltUAxoNLP5A+mcOoqylYgkNPq
	geuhFoSTiqtewFE0RGQG9H6ow6eWEoqL5BCdMoADIXjktUORVZvD7CR046NfOdhAUjnlXSGGkhQao
	NiXiBKLq0vIG4Blrzfok15eyX3WkuS8JV+UTiMOVJzpD1F4M1IFDFkpiNKfzdxihnD0bj8Eb+K/xZ
	lFVrsOEzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l73RQ-0004h9-QJ; Tue, 02 Feb 2021 21:42:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l73RG-0004dl-VD; Tue, 02 Feb 2021 21:42:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C60B264F64;
 Tue,  2 Feb 2021 21:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612302142;
 bh=tHIskrs77dAlTC67id/8EbLayMPvIv2xvnqtYbicfpw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tbZfQlZCgTNZRdEfxguubzEXJzM3yCC0BkedmGOlEVa5DVARCOwTYELnEcwIxPifB
 Qc8OVpVl4HcsXBE476bpvbzq/kTIQhbOjXTOXLTHBSyQXHdQdni6Wwc116eCWRotlO
 EW6i49hCtqgDfOncRmzAKhYP3ZODeFtKScH8mtcPm0uAqS8/F6XR3EqaOwEwCE08EI
 20P9zIYv050NFfOMi12Ctb6GYyx/dir/ZLmjBhRufjyzLq/1rEvqIbfyVi7wBPjHZl
 R5DEqZKNCZSoNlSi2lCqT5LM48zTzvwzjKeqfNlGeT+dkcEeYoYeFwkTLWfab/MQvC
 eR7d2pRnYKCQw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 arm-soc <arm@kernel.org>
Subject: Re: [GIT PULL] defconfig: mediatek: updates for v5.12
Date: Tue,  2 Feb 2021 22:42:18 +0100
Message-Id: <161230212660.1903845.9537222226422007061.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <aa5c6673-f018-00d3-42da-46a4976d8ef7@gmail.com>
References: <aa5c6673-f018-00d3-42da-46a4976d8ef7@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_164223_130452_34C68DDB 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Neal Liu <neal.liu@mediatek.com>, Argus Lin <argus.lin@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 1 Feb 2021 11:19:36 +0100, Matthias Brugger wrote:
> Here comes a few updates to the arm64 defconfig. Please have a look.
> 
> Regards,
> Matthias

Merged into arm/defconfig, thanks!

merge commit: 77bad664169a7b5ea954638cf049d063b8b055cd

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
