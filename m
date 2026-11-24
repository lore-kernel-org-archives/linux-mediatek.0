Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199C5606A31E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iJeBKEYm;
	dkim=pass (1024-bit key, unprotected) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=JKHq5xUU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZWW4JoTl6P7PwiqYC1DkrQQs0nLQlzJs5F139zXifZc=; b=iJeBKEYm03zs0NhTWvQkDczZFe
	qQkGvF/VSqY3RUQ9d4B++6esEeXRXeMygCQgrrEV2v4eaWP5Ab5rordmmGtgEclfCkrHSYhzB/em3
	Bn3gJFw/6Yjtp0pkHwMp4/LjokLn/dxi/sduWD99bTLxa6crUb+kcPWoS56k3yDNuYaBZM+sp+iO3
	44+2/EVsdyFtWYrMt4gUdPjE07HBxuZmcqJ7WbfV2LxpKc7LC2xbbovvhxkvB6fs6bsap7QChCb/h
	W+HJZDzsX2TI1BcHHQp9CKQhsw4rVlKslyPJeoRiPtBJdqRVzJazyut9NgIBEESg4GB+IrFwtrPf8
	KO1j1TOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlro-00000005t10-2gQK;
	Tue, 24 Nov 2026 08:27:08 +0000
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net ([46.101.248.176])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlrj-00000005szP-2g1H;
	Tue, 24 Nov 2026 08:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZWW4JoTl6P7PwiqYC1DkrQQs0nLQlzJs5F139zXifZc=; b=JKHq5xUU9sdS8
	Zp70roUs3cHHhASnmFbYI2V7Cyl/6QIU82WmpEDivRnXAiaSXpXClXVRZHO07X/g
	7b+EiTztWHoVpToBXOy+hHoF5aNDLbWW6JSgLMIc0zRDnviSND/Qx+rSxv7m7sEx
	F30AMkl2lBHiHOPQVzMoG1JyjYwskA=
Received: from mt7530_series_00.eml (unknown [58.206.202.11])
	by web2 (Coremail) with SMTP id yQQGZQAXRGg4SgVrg7NjAQ--.65249S2;
	Tue, 24 Nov 2026 16:26:33 +0800 (CST)
From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
To: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch, olteanv@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 0/5] net: dsa: mt7530: fix regulator disable on teardown and error paths
Date: Tue, 24 Nov 2026 16:25:57 +0800
Message-ID: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: yQQGZQAXRGg4SgVrg7NjAQ--.65249S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4DZFy5tr4xKF47ur1rWFg_yoW8Xw4Dpr
	y7Wasayr4DWFyI9a9xC3WIvFW5XrZ3CrWfJwn7K3yDtw1YyF18tr1vya48ua47GrZ7Aw4S
	yF4kAry8uFsrZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r
	18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r43Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5pVbJUUUUU==
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgIBD2sFSC8EeAAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_002704_631209_9020A47B 
X-CRM114-Status: UNSURE (   6.63  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt7530_setup() enables the core and io regulators, but they were not
always disabled again:

 - the disable lived in the driver's remove() callback instead of the
   matching teardown callback, so a switch whose sibling failed to set
   up was torn down without reaching remove() and kept its regulators
   enabled, and

 - the error paths in mt7530_setup() and mt753x_setup() returned without
   disabling the regulators, leaving the rails enabled and making the
   regulator core warn when devres later put an enabled regulator. The
   common case is mt7530_setup_irq() returning -EPROBE_DEFER, which
   re-enabled the rails on every re-probe.

This series splits the original patch into five small, independently
obvious changes, as requested by Andrew Lunn:

  1. Move the disable from remove() to teardown().
  2. Factor the disable into mt7530_disable_pwrs().
  3. Register the GPIO controller last so it is not published across a
     failed setup.
  4. Disable the regulators on every mt7530_setup() error path.
  5. Do the same for mt753x_setup(), moving the mdio irq teardown to the
     end.


Haoran Wang (5):
  net: dsa: mt7530: disable regulators on switch teardown
  net: dsa: mt7530: factor out mt7530_disable_pwrs()
  net: dsa: mt7530: register the GPIO controller last in setup
  net: dsa: mt7530: disable regulators on setup failure
  net: dsa: mt7530: disable regulators on mt753x_setup() failure

 drivers/net/dsa/mt7530-mdio.c | 14 +-------
 drivers/net/dsa/mt7530.c      | 60 +++++++++++++++++++++++++----------
 2 files changed, 45 insertions(+), 29 deletions(-)


