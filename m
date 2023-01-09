Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24519C5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 06:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyGRTRWimbjQJP4q2I3aeWxBjtM7P5hqJgHcrgc7bxE=; b=1ASFapNrOP8zIb5FXjTo1XQDZ2
	1iJVyXJ42eRkX1vdY6cDD7L8isXXYe45bsNbPwQgMjH2IeAFwpkIJJmuOPVsMATpbBQGlwW0hg4+w
	Ro3J/6SPGjMWBf5BeYSmqtCRf2BxYB5fCmJGsNSFiXE7JB+grRbdDcBqEoDgHf0mp57sQnu7Lapvo
	/MPzZfEQARiBpH+Z1OUS+QtBgzRHGeau9uyPsokBD8anxj72fgRWuPfU6rVI2jRriKAWC3iHmdOOT
	6x9oMH8BgF4QTum4CpuB1+FM7Fm7llYAe57vQYYXrwwNS5aMRGX/JnqAov3+hv7Ho9wBhfPBoRkxz
	++eEzezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEln7-0001Dy-W2; Mon, 09 Jan 2023 06:37:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pElmw-0001BC-US; Mon, 09 Jan 2023 06:37:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4EF9060F05;
	Mon,  9 Jan 2023 06:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C11C433EF;
	Mon,  9 Jan 2023 06:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673246260;
	bh=bVLTMxPnUysXSdp+BMthEAJ/MbC4ZegjDQ4Z+dd2TJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eNgCVLHrJhMKwApUN0XPi8zRLLKGwOrG9MIFlETRZLjAEC2zIQCPSg2epNZU9DYTL
	 BvsCofc1B42wNwPNsrsVKY2BfXq5pF/VRHzKllBra2iJoeXssmJIBUvWaSucE44MOk
	 2EkmnXWPjadGIl8DaOzH3Ga4pEEbIWOM17CqJzE4=
Date: Mon, 9 Jan 2023 07:37:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: cy_huang@richtek.com
Cc: linux@roeck-us.net, heikki.krogerus@linux.intel.com,
	matthias.bgg@gmail.com, gene_chen@richtek.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpm: Fix altmode re-registration causes
 sysfs create fail
Message-ID: <Y7u2MSCNyeNxwei5@kroah.com>
References: <1673228092-27281-1-git-send-email-cy_huang@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1673228092-27281-1-git-send-email-cy_huang@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_223743_069217_5A7EA040 
X-CRM114-Status: UNSURE (   9.24  )
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

On Mon, Jan 09, 2023 at 09:34:52AM +0800, cy_huang@richtek.com wrote:
> ************* Email Confidentiality Notice ********************
> 
> The information contained in this e-mail message (including any attachments) may be confidential, proprietary, privileged, or otherwise exempt from disclosure under applicable laws. It is intended to be conveyed only to the designated recipient(s). Any use, dissemination, distribution, printing, retaining or copying of this e-mail (including its attachments) by unintended recipient(s) is strictly prohibited and may be unlawful. If you are not an intended recipient of this e-mail, or believe that you have received this e-mail in error, please notify the sender immediately (by replying to this e-mail), delete any and all copies of this e-mail (including any attachments) from your system, and do not disclose the content of this e-mail to any other person. Thank you!

Now deleted.

