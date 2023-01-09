Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAD4C5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 06:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUaWoLMzDub6Xt7vauwMMps6jvPNvvRUyqmv34zzaJA=; b=owpFrIuXvaBOJaADWUrFCpv1aH
	JebqsJatiua1Z/r152+jYfo+UFwqW0uLAoNMnJOV5eDRDaYnTGszkFIi2Goxb+p9wwkGT/ThtzAoM
	45NOMCmer4CRj1zl8SqXNkV3JhOcyEEmQl0SSPEceOTSaKmV8Tz7tqXr2Q4OeT31YrBZ2xxcNOnTx
	CH47EZRlitacCmXChfsQJ4T1m4Ts1g1hf41Nl7DAfFhVAf3uiWzgnuQlGog0hcuLTRfCnJ9b77r2O
	1ubrY7TIHz5MDrppffDTMLkET8WS5E1i+5VWdlJqmQjJzEkhPe3FBHxxDIaukrKO0lAFYhHp9+Ctq
	s8g7ZQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pElnv-0001RK-PO; Mon, 09 Jan 2023 06:38:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pElnl-0001Nf-Hd; Mon, 09 Jan 2023 06:38:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EB6BDB80CC2;
	Mon,  9 Jan 2023 06:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F75C433D2;
	Mon,  9 Jan 2023 06:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673246309;
	bh=ukfbSqJW0Cm2XtvJ49T4sD/afoBZVz0kpsHg//QmYJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lYANWEn1/25u5rxtA9K7ypYuZLqX8hqXoZvE9XUyxGgGE8i5zQ2Mn7jnH/igwGQb2
	 3U8q7NjUatgPYOlx0ZnSf3JYmxWap8BMvkmAmOw0Y7c8oA7Vqpgfyb/qPFr75iKbX3
	 M3n/qge7ELglOR7PAqMkP+f2wifnUZeJ0UY8bN9k=
Date: Mon, 9 Jan 2023 07:38:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: ChiYuan Huang <cy_huang@richtek.com>
Cc: ChiYuan Huang <u0084500@gmail.com>, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, matthias.bgg@gmail.com,
	tommyyl.chen@mediatek.com, macpaul.lin@mediatek.com,
	gene_chen@richtek.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: Fix altmode re-registration causes
 sysfs create fail
Message-ID: <Y7u2Yi+UeqMcVhad@kroah.com>
References: <1671096096-20307-1-git-send-email-u0084500@gmail.com>
 <Y5rsdo/SGHJM4UKG@kroah.com>
 <CADiBU3-iVLQf6Q5SzOB_pMCs2PGcFuWryjpDn5Qvz41WQ6C2RA@mail.gmail.com>
 <Y5sIZ3zC6o4ARDEn@kroah.com>
 <20230109014123.GA27423@linuxcarl2.richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109014123.GA27423@linuxcarl2.richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_223833_752340_9EC95371 
X-CRM114-Status: UNSURE (   9.43  )
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

On Mon, Jan 09, 2023 at 09:41:23AM +0800, ChiYuan Huang wrote:
> ************* Email Confidentiality Notice ********************
> 
> The information contained in this e-mail message (including any attachments) may be confidential, proprietary, privileged, or otherwise exempt from disclosure under applicable laws. It is intended to be conveyed only to the designated recipient(s). Any use, dissemination, distribution, printing, retaining or copying of this e-mail (including its attachments) by unintended recipient(s) is strictly prohibited and may be unlawful. If you are not an intended recipient of this e-mail, or believe that you have received this e-mail in error, please notify the sender immediately (by replying to this e-mail), delete any and all copies of this e-mail (including any attachments) from your system, and do not disclose the content of this e-mail to any other person. Thank you!

Now deleted.

For obvious reasons, this wording is not compatible with kernel
development :(

