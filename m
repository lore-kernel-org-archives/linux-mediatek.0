Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35B2C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 00:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QZAjS95kQWk6ulB5K3KIO57nupf8DuHMQvfoKGW+t8=; b=WsX0w9I9hAMmqqd7q2/sfcPAg9
	Z6RJizODNNTdqH2cSGPjcaFmaGlbqVKDTjiE67yHdribgBw4MgUzG24hAON0kqvI6qzqqmydBtREI
	cUsrj5F65a6cpxRwZvn7Q9pktxkccLpVYmLpBGERG8aUPFXVn/VYIvbDmFbNGt/7JC4I7DMdEwVw9
	fzZzbNag4Wv/v++0HiG/qEREok/Gjhn4GLNTyFFAH3NLmZPFjRW50rZM/gmGGDT7T4N/eY9UixNgZ
	fYFfCUVwRFA9R3alx0IqP1WgVXoce0udGSuTpLgPLPBuOOjsXp6/i6SaKQ0JibbHqw/jAeekrCiUp
	uzFOWBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9bnt-00HYr4-HV; Mon, 26 Dec 2022 00:57:21 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9XE6-00Evf9-UE
	for linux-mediatek@lists.infradead.org; Sun, 25 Dec 2022 20:04:08 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1p9XDy-0003eb-1w;
	Sun, 25 Dec 2022 21:03:58 +0100
Date: Sun, 25 Dec 2022 20:03:56 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Vishal Rao <vishalrao@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: Wifi 6E 6ghz not working on MediaTek MT7922 (AMD RZ616)
Message-ID: <Y6isrKS7zgMrNe3S@makrotopia.org>
References: <CAMWtyy1sSHc_DYQ3kq+FWMJKK5Wo3QEgO1yd6wQXx3x0Lp4Uog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMWtyy1sSHc_DYQ3kq+FWMJKK5Wo3QEgO1yd6wQXx3x0Lp4Uog@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_120407_193172_9C3A0A5D 
X-CRM114-Status: GOOD (  11.66  )
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

Hi!

On Sun, Dec 25, 2022 at 08:19:15PM +0530, Vishal Rao wrote:
> Hello!
> 
> Using Ubuntu 22.04 LTS based distro elementary OS 7 with the latest
> available Ubuntu mainline kernel 6.1 RC5 build the wifi does not
> connect to the 6GHZ band (Wifi 6E) and it only even shows the 6ghz
> SSID name *after* I have connected to the 5ghz wifi band.
> 
> This is on a new ASUS ZenBook laptop model UM5302TA with the AMD Ryzen
> 6800U CPU platform which includes the AMD-Mediatek co-developed RZ616
> wifi chip I believe.
> 
> Pastebin of lspci -vvnn output: https://pastebin.ubuntu.com/p/QwM58ZkptG
> 
> Let me know what further information I should provide - happy to do so!


Please also share the output of `iw list` which will tell if we are
dealing with a driver problem or a regulatory/configuration problem.
Did you configure the wireless regulatory domain the device is located
in?

To have access to 6 GHz bands the regulatory region needs to be known,
I read that on Ubuntu it works like this:

https://askubuntu.com/questions/701709/how-can-i-change-my-wireless-cards-regulatory-domain-dbm-higher-than-30

