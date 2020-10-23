Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6DDC55178
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 10:13:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B91B2208B6
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 10:13:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xS7n19DY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="bb/ID+nt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B91B2208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4MKC7F0gAlXTDcT/rBlRaE8uICnCJzr50jhowUqiVBU=; b=xS7n19DYSg+7hWpiScd6znUWp
	1Mm/b1LK/7x1sgKQC4XrNsxIDNQ92GjX560wNuXVZblEdua0G004z1PG2Cb/+yS6ER4QuEt5vOCp1
	4dbyZKQ7RNjF1F8i5gHikQ02hde60Tpm+E2Z4njVuhXWpvBvNoQZPPIQ47q5RZFz5GTi3lUl76qhc
	oX6P2Vg1//wM+P6prgpjymL2nXjThBbC+vcImTU8WP50fzyaaJaoPYT4iCM6DpEIy54j/O/NHQZwD
	3081ZWLodNI8HSafOLmRw0Hn03nezTzDpD3dc+pPpQ9BjVvE9/OH4CwjiyG89PQITos8uCQ3uSSme
	+U3P7zNbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVu4I-0001dj-IK; Fri, 23 Oct 2020 10:13:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVu4D-0001by-6w; Fri, 23 Oct 2020 10:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Etqkj2bfKGrEGoasEHlQF8c/aYVNaOVt7ntOYQjQy0U=; b=bb/ID+nt/J/pIMZmWsDKIuo9f
 jylxYWY6FzN4XPAxXyJTeSC6OgQs6+fzpVejDl1UozSPJSvSI8UKdW3pVUtRljaVybV4biSqDKMJ/
 JVTTaJk1IZknFfdMjEqGs3zD07xjeaJump4i1INPvETbcPy75j5Xh8AHgL6Uh16FaX3+YXxpg7EDU
 LnC4K8cohqxa40H7oWEqfG6MdtQElFWfiIM6z5m+3tZgWL1MJpmQ9a3bkNA8zfeENLphhDC0F9/gm
 8wpGlzFsijAwLCcZDGP7LUW5tbgvZkj9X0mkr5WRjRCJYMVrwS5jOgDxu3XGHAqKZeB7OTuSji26m
 DgThbypDg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49922)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kVu4A-0003HE-Qn; Fri, 23 Oct 2020 11:12:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kVu4A-0008MK-4j; Fri, 23 Oct 2020 11:12:58 +0100
Date: Fri, 23 Oct 2020 11:12:58 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 4/4] arm: replace vector mem type with read-only type
Message-ID: <20201023101257.GZ1551@shell.armlinux.org.uk>
References: <20201023091437.8225-1-miles.chen@mediatek.com>
 <20201023091437.8225-5-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023091437.8225-5-miles.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_061301_289153_28B1B3DC 
X-CRM114-Status: GOOD (  16.55  )
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
Cc: wsd_upstream@mediatek.com, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 linux-mediatek@lists.infradead.org, Suren Baghdasaryan <surenb@google.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 23, 2020 at 05:14:37PM +0800, Miles Chen wrote:
> Since kernel no longer writes to the vector, try to replace
> the vector mem type with read-only type and remove L_PTE_MT_VECTORS.
> 
> from Catalin in [1]:
> "
> > I don't think this matters since the kernel no longer writes to the
> > vectors page at run-time but it needs cleaning up a bit (and testing in
> > case I missed something). IOW, do we still need a dedicated mapping type
> > for the vectors or we can simply use the read-only user page attributes?
> "

Catalin is incorrect. If CONFIG_KUSER_HELPERS is enabled, then the
vectors page is definitely written to - it's a user interface, so
it's not going to change:

#ifdef CONFIG_KUSER_HELPERS
                        /*
                         * User space must never try to access this
                         * directly.  Expect your app to break
                         * eventually if you do so.  The user helper
                         * at 0xffff0fe0 must be used instead.  (see
                         * entry-armv.S for details)
                         */
                        *((unsigned int *)0xffff0ff0) = val;
#endif

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
