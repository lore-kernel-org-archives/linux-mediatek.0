Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16AFC5475B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Mar 2024 17:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BXvq7/9NPYJ/Ixj6YfKKuxDkLPRgRYOWOtx68zc0u4=; b=erRdmRODAQZGS70ECyGl4rI9GE
	sZuXb9GP1ZR16CsjnIJb/cR+OOZs/HwbZCWJmrObZDP5/QA81SqE4cAeqtZcQlcUK5KXg9W94V5GH
	HkgzqIHhYU4sPhYCO333OX2QTuQNEvFiP2q2jN45jsV+fYLnYWmOgbs1bEriSStdNGnUn7psSejWN
	OFDZFhQ2Es8txBAYYY0G2j2rdFix6yj7OszXYQIenNGYs1ATYJPnTGNF8plDdc5SU+Rn5a+5yXsRP
	PjA+NpSOzql7hoHB/btVkkAshJuBMBNgpWJvdMtaG9c6oK1gk+KBIEmR15Hggsi6Qa2/ReN8p9Ff7
	ucssiw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhuxJ-00000001Aok-1SD7;
	Wed, 06 Mar 2024 17:21:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhtof-00000000vYF-3BXb;
	Wed, 06 Mar 2024 16:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2BXvq7/9NPYJ/Ixj6YfKKuxDkLPRgRYOWOtx68zc0u4=; b=X/frY84YmqUJjF4lzJXYt/08/j
	DZ891OHVHmDaBvKUNzUrVSjEp+tGEBYA5ua7a4CFY9bpOC0avco5ZN1wnq4dQonM5nvxQZMrSvnnY
	kzYyZql86bHjFdDSSzHyZFQszOG/Ot4+RjtkJMN9EMwL2dBKNQ7MjFiAtQjFMuX85TOfn8ZA7WgLI
	kM9Si5I2cektAoFDDrerXbGToH2qExfmqd2rEZ23R7dG93BDz0IGL5LCPWaSAv2q103Ni9JsRVQYk
	fkDpG9N2XASVi1GRc9Qz+GlfNAJyD3pyhJCjBiREQwn0ufk5UZhq8vBJyc1OnO3LAfAucdo4gWO2Z
	UGlzUyrg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhtoV-00000006BHF-06wO;
	Wed, 06 Mar 2024 16:08:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33D301FB;
	Wed,  6 Mar 2024 08:08:49 -0800 (PST)
Received: from pluto (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 289733F73F;
	Wed,  6 Mar 2024 08:08:10 -0800 (PST)
Date: Wed, 6 Mar 2024 16:08:07 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Flash Liu =?utf-8?B?KOWKieeCs+WCsyk=?= <Flash.Liu@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	Cylen Yao =?utf-8?B?KOWnmueri+S4iSk=?= <cylen.yao@mediatek.com>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] firmware: arm_scmi: Avoid to call mbox_client_txdone
 on txdone_irq mode
Message-ID: <ZeiU5_k7s-31A93h@pluto>
References: <20240201095754.25374-1-flash.liu@mediatek.com>
 <ZbzKckIhn8HQv5pW@pluto>
 <053cb4a2edfe576412942daed2f7055b2ba9e207.camel@mediatek.com>
 <56e1b2f5adbca437a14b738e1c58a054f6302fcd.camel@mediatek.com>
 <Zeg8F6VVaZtpmH8n@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zeg8F6VVaZtpmH8n@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_160815_610340_CB424516 
X-CRM114-Status: GOOD (  34.29  )
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

On Wed, Mar 06, 2024 at 09:49:16AM +0000, Cristian Marussi wrote:
> On Wed, Mar 06, 2024 at 06:13:48AM +0000, Flash Liu (劉炳傳) wrote:
> > Hi Cristian,
> > 
> > Kindly ping :)
> > 
> 
> Hi Pin-Chuan,
> 
> sorry for the delay...I have NOT forgot :D, indeed I was just testing
> yesterday with some mailbox IP of ours equipped with a TxAck IRQ and I
> would have some question for you because I've seen some anomalies while
> using this: does your solution work reliably in your setup ALSO when
> multiple SCMI transactions are attempted ? (like cpufreq issuing cmds
> while polling a sensor from some other thread)
> 
> ...I'll dig deeper today in this matter, but my current suspect is that
> using the mailbox TXAck IRQ to let the controller tick the internal mailbox
> queues does not play well with SCMI, since the SCMI TX channel is really the
> SCMI "a2p" bidirectional channel and it is associated with just only one shmem
> area used to hold both the egressing CMD and to receive the incoming REPLY
> from the platform: so if you let the controller tick the queues as soon as you
> received the TXAck you are telling the mailbox subsystem to queue another message
> on the same area while you are not really done, since only the client know
> when it's done with the whole SCMI transaction and the reply has been fetched.
> 
> Indeed, for these reasons we have the BUSY/FREE bit in the shmem to protect it
> from pending new requests until the previous one has completed, but when the
> waited-for reply comes in, the platform would have cleared the BUSY bit and
> let the new queued message overwrite the pending reply prematurely, and one
> message is lost...
> 
> ...but as said I want to delve deeper into this, as of now just suppositions
> and maybe I am just missing something more that has to be configured
> properly...
> 
> Thanks,
> Cristian
>

Hi again :D,

so articulating more on my supposition that TxAck-capable mailboxes and
SCMI do not play well together (and would not be worth either really...)

Consider the following scenario.

1. scmi: mbox_send_message(X) is called from SCMI stack to send mesg-X
         on the a2p channel (a command)

2. mbox: mesg-X is
  2a. queued by mbox subsystem [add_to_rbuf(X)]
  2b. submitted for transmission [msg_submit(X)]
  2c. prepared by SCMI clk->tx_prepare
  2d. finally sent via mhu driver .send_data
  2e. mesg-X is now an active_req for mbox and in-flight for SCMI

3. scmi: ANOTHER mesg-Y tx is attempted via mbox_send_message(Y)

4. mbox: mesg-Y is
  4a. queued by mbox_subsys [add_to_rbuf()]
  4b. NOT submitted since there is already an active_req=mesg-X pending

Any further SCMI mesg TX attempt will behave similarly: queued/not_submitted
till at some in the future someone calls the txdone routines, which in turn
calls tx_tick()...this SOMEONE can be the client, like it is now, or the
controller if it is configured to use the TxAck IRQ (as per-your-patch)...
...so lets see what happen in your TxAck enabled case.

5. TxAck IRQ received, transmission of mesg-X has been successfull
  (NOTE that SCMI at this point is still waiting for a reply to mesg-X..)

  5a. controller calls mbox_chan_txdone()
  5b. mbox in turn calls tx_tick
  5c. active_req is cleared and next queued mesg-Y is submitted
  5d. mesg-Y transmission gets anyway stuck on cl->tx_prepare since
      we check the SCMI shmem BUSY bit and busy-loop there till it
      clears: this clearing can happen ONLY after the mesg-X reply
      has come through, since it is the platform SCMI server that
      clears it having delivered the reply in the shmem.

6. platform SCMI server replies to mesg-X finally:
  6a. platform writes reply in shmem
  6b. platform clears BUSY bit

  -- note SCMI stack is still waiting for a reply at this point...
     so waiting for an IRQ OR by simply spinning on that same BUSY bit
     if polling mode was requested for the transaction....

     ...lets assume you are in IRQ mode:

7. mesg-Y sender which was spinning on BUSY bit (blocked on tx_prepare)
   is immediately cleared to send and so tx_prepare can proceed further
   and completely overwrite the just received mesg-X, which is now LOST

..in case you were polling I guess you will have anyway some corruption
due to the race between the polling-mesg-X-receiver retrieving the reply
and the same tx_prepare codeflow as above...

Indeed, the spec says that you should protect the channel till the reply
has been retrieved from the SCMI (even after the BUSY bit is cleared), and
in other transport we DO have some form of locks, BUT here in mailboxes
there is not since it is NOT needed IF you stick to the non-TxAck original
behaviour, since the tx_tick, as it is now, will be run by the SCMI stack
ONLY after it has waited for mesg-X and retrieved the mesg-X-reply payload
...not before.

Instead, if you enable the TxAck mode you are basically letting the controller
itself issue the tx_tick(), which means "previous TX is done, please proceed
with the next", BUT the current TX is really NOT done at all as intended
by the client (SCMI), since the reply is missing and the only entity which
can have the whole picture about when a transaction is completed (or timed-out)
is the SCMI client.

As said, I think the fundamental clash is between what the mailbox
subsystem considers a TXDONE event (and related actions) and what
instead is considered a completed transaction on the SCMI a2p channel:
i.e. CMD_sent + REPLY_retrieved.

At the end, anyway, would it be worth in any way to leverage such TxAck
capabilities (somehow) of a mailbox in the SCMI world ?

I mean, even if we make this work, what is supposed to happen better and faster
when using a TxAck instead of a TX_polling mode like it is now ?

...because the SCMI stack cannot really do anything with this information in
this case, given that there is just one single a2p_shem area for sending command
and receiving replies...it has just to wait anyway even after the
TxAck...

..maybe it is a bit more power-favourable to sleep_wait for the TxAck IRQ
instead of polling the MHU regs ?... other than this the TxAck means nothing
really in the context of the SCMI world, since you cannot safely queue anything
more till the previous exchange has fully completed...

...in other non-SCMI scenarios that I experimented with, it really makes a
difference havig the TxAck since it avoids all the internal polling/requeueing
dance in the mailbox subsystem, but in this case I think is all made useless by
the way SCMI/SMT based transport works...i.e. using a single shmem area for
the a2p channel..

...not really a short and sweet email... :P ... any feedback or further
ideas are welcome anyway...especially if you can prove that all of the
above is somehow wrong, or that there is a good reason to leverage the
TxAck capable mailboxes  :D

Thanks,
Cristian


