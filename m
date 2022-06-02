Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D13AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 20:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:
	Subject:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ENn4YVHDnhhxY9hfv4zLH0R/+ZSaaqbYJVb4gyrPNzo=; b=hyXdo0B7WcYgOb
	UvAivaVhMTol0mCKgk2cl6R5Jhf440eAV9JJFE+JbTQbDQM9T9M2zIj9FrdZZHn2vyN1YMvVuDJGw
	nOewC8crdYdkFJpAF+rzNQ4qhRHexh9KFVHCIM2m5fKZjPPWrj+4cS+pxVZ2RgWTPQsvp/ESoBxvZ
	q/76HlbAmKRqI6Bu2+NO1/6rHi43j6UT8FtzU22qBqxO5PPlZ/o70BI6aqD1qa+Dc9HO2VyuIkbJE
	jHPpfAXgD/0fEIcXl5Cx4xpRW8zKEB2rnuW9Xu/4bSNcHy/ak7OrIGqe3ZFlIkK5++82ARxU333+d
	IK5GE3JEPhYX1OmQpDEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwr90-004Cjh-Vd; Thu, 02 Jun 2022 20:10:11 +0000
Received: from smtp687out9.mel.oss-core.net ([210.50.216.236])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwr8y-004CdO-0d
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 20:10:09 +0000
X-IPAS-Result: =?us-ascii?q?A2DMcgDRFZli/7NplnpaGQEBAQEBATwBAQEBAQEBAQEBA?=
 =?us-ascii?q?QECAQEBAQEBAQEBAQEVCYFGAoE6AgEBAQGkPYcZG4IliWMLAQEBITAEAQGEe?=
 =?us-ascii?q?AEBhVEmNwYOAQIEAQEBAQMCAwEBAQEBAQMBAQYBAQEBAQEGBIEchS9GhlQgB?=
 =?us-ascii?q?wGBVgEOAR6FdQEBrG6BMw10hFkUghAECoJzgTsCAQEBAQEBiUGFX32BEIFIg?=
 =?us-ascii?q?kgBhX2DQIIuBJJGhCMEGzsDIRUYNBKBIUUsAQgGBgcKBTIGAgwYFAQCExJTH?=
 =?us-ascii?q?QISDAocDlQZDA8DEgMRAQcCCxIIFSwIAwIDCAMCAy4CAxgJBwoDHQgKChISE?=
 =?us-ascii?q?BQCBAYNHgsIAxkfLQkCBA4DQwgLCgMRBAMTGAsWCBAEBgMJLw0oCwMUDwEGA?=
 =?us-ascii?q?wYCBQUBAyADFAMFJwcDIQcLJg0NBCMdAwMFJgMCAhsHAgIDAgYXBgICcQooD?=
 =?us-ascii?q?QgECAQMEB0lEwUCBzEFBC8CHgQFBhEJAhYCBgQFAgQEFgICEggCCCcbBxY2G?=
 =?us-ascii?q?QEFDk8GCwkhHAkgEQUGFgMjcwVIDyk1OQZ8D65SkECeMwqDTgUpB4EJB55JM?=
 =?us-ascii?q?YNjAZcSEQEngVeLVJZoqBKBGIF/cBWCCIEcUCidEIEQAgYLAQEDCY8KAQE?=
IronPort-Data: A9a23:Gaw2rq0S7A/fc9cyxfbD5UNzkn2cJEfYwER7XKvMYLTBsI5bpzMOm
 jccDW2FOP+JN2D8et10PYXno0NT6MfXx9I1Ggdu3Hw8FHgiRejtW43Fch+Y0wB+jyHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr+dUsxNbVU8En1510o5w7RRbrNA2LBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2yxH5OKkiyZSZdBMUdGX78tmSH
 I4vxJnhlo/QEoxE5tmNyt4XeWVSKlLe0JTnZnd+A8CfbhZ+SiMakaA7Peg7VlZuiG+SocBWw
 /xQj8aQYFJ8VkHMsLx1vxhwLABYeI8Z15HrC1GY7JWxp6HEWyK2mbM3URlwZNVFvL8oUAmi9
 tRBQNwJRhGFieWexbu9RvgqjcMmRCXuFNNF4iw+kmqJZRogaZnmUava9N585z4X2INCOfbAT
 ZcXMAM6OXwsZDUKYD/7EqkWmOaum2m6djBUqVuJqKkf52nI0Bc30b7jKtPZd9WGA8JPkS6lS
 nnupj6jR0hHbJnGkWfAqy39wPTTlGXkUpgVHbGy//hmxlue2ioaFXX6SGeGnBVwsWbmM/o3F
 qDe0nNGQXQanKBzcuTAYg==
IronPort-HdrOrdr: A9a23:1RcbmKMErDH0fsBcTqKjsMiBIKoaSvp037BN7S9MoH1uHvBw+P
 rOoB1273TJYUgqOE3I8OroUJVoJ0mzyXcf2+Ms1NmZMTXbhA==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.91,272,1647262800"; 
   d="scan'208";a="82056738"
Received: from 122-150-105-179.sta.wbroadband.net.au (HELO WIN-J7GFDBAO51J) ([122.150.105.179])
  by smtp687.mel.oss-core.net with ESMTP; 03 Jun 2022 06:01:22 +1000
From: "Martin Otamori" <info@mandy.com>
Subject: Acknowledge this message
To: <linux-mediatek@lists.infradead.org>
Date: Thu, 2 Jun 2022 13:01:19 -0700
Message-Id: <20220206130117F9AC918C30$71A98EB078@mandy.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_131008_301617_46FD880A 
X-CRM114-Status: UNSURE (  -2.05  )
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
Reply-To: okkmart68@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

I will give you more details as soon as you acknowledge this message.
Thank you.
Martin Otamori.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
