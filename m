Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C21ED116F3
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 18:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogMLGmtOshBfVKRfoXkEi7qBuLHFEcc8LO3WBxBRNAk=; b=qh8ASl8n47BwFu8wSCPsOxqOa9
	AV5MU8q42PJZLPHUECNRP8auTpcaPrzl9PSRcguT0QOseSsPG2oIc/E8c6urv5x4gEVFxWt11OKWt
	eFoM5COL16y4vSVdbE0aQSxfsL/cUSXxqDX1jh950BTcVimPJDz7fgHloW7jT5XMJiq1z26PssvPs
	0fo7JHf/5m6PJBXcyQmpG24SAFmrnPVF2GWa56pCiIxyYb3usfaa+Hlp3Kx55MCj1rdWOAoDBdEps
	ulzBvWeD9Zw85spOgUYvkL8sM31wphjjvD3sttHMQvTVaVqiJrtgJ39DmM/qxQMQHIu8BLso50voS
	kZIE+tBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ8kH-00000004QZ9-1lXO;
	Mon, 01 Dec 2025 18:35:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ8kF-00000004QYr-44SE;
	Mon, 01 Dec 2025 18:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 377F86014A;
	Mon,  1 Dec 2025 18:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83049C4CEF1;
	Mon,  1 Dec 2025 18:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764614130;
	bh=VBQFlvnfpbsIVYd7kucDkAsZ9TrCBZTzgqxZRRFJ9xA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DqCjxBEAx9GYCBJaYTNiYd64kKa8S/v0nyYaM47cIxx6x5dS2qxta4cb8ccKFlfK+
	 bbElowOjQLNB8S2ZZY5VeXmGtSXKqKSRTRXiwgcldQKpO0PQA0Y4Vz/nlMslQAeGEN
	 lwGwBiFxiix6kslLsoZ1RS9uljoGAWFAxTi/gw3miJqV+gKMuftxGEiC0La86z1hLS
	 7uYxZsFC7PkbjHlXjHMi5SC9kExUk+0XZY5B36ZdK4LhcH6TYHUg04UB97OAU7FUoF
	 SfSclH0QhROBkzGB3fibk7fQ8WkUMvUHqK0IjXEfKGjC2VBOtHrJFE22niJALHKnQM
	 7WedwgfcoYqMg==
Date: Mon, 1 Dec 2025 10:35:29 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH] wifi: mt7601u: check multiple firmware paths
Message-ID: <20251201103529.1874a869@kernel.org>
In-Reply-To: <20251201090336.1157193-1-christianshewitt@gmail.com>
References: <20251201090336.1157193-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon,  1 Dec 2025 09:03:36 +0000 Christian Hewitt wrote:
> The linux-firmware repo moved mt7601u.bin from the root folder to
> the mediatek sub-folder some time ago, but not all distros create
> symlinks to the old location the driver checks. Update the driver
> to check for firmware in both old and new locations.

IDK.. 2.5 years ago.. how long is too long to wait for the distros 
to update their linux-firmware?

