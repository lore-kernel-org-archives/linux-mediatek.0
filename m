Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67756C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 06:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDS3qw5GNR3NehEKLD6OquNxC1YWHvl4bHXwbjBhoYA=; b=g21xdk99wE0teD
	CDaIPt3zDKzw73fOOJmjlc1U89GzQLqbZOhj8PKPMUdhssm8Wbcvp3SFnR1gFky8i1ohVcafI66om
	mNv2kxD5c/sXMzqcU5iVVXr4z3YO2rBqAoUGop5GSKE3ZUmVqqcn5HMI4xOsDjMlyRK4Ne/jibXr3
	L9kgqF+bI8lIMD/ruEnYgu7nmH6S+6KELPs3L5VCo2W85AGTkFGPNkyEPHwSf/0WIgySqkKBuFtj6
	8JxtiIKXEYTPS3QI/0e2F5OWik7RUnM4ZTWmCDMV0VQJ+0+o53cEseNIXWFHAXSd3OUFp1spOq6Oj
	R23U0e7rkFeQY6I5w/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpPfH-0011ec-UF; Tue, 23 Nov 2021 06:52:27 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpPfF-0011dY-3A
 for linux-mediatek@lists.infradead.org; Tue, 23 Nov 2021 06:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637650330;
 bh=D5V9g9Q2kV1q2sYqTY8Pkx19avIpNQBHWhSveo2yESk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Wb1dLs9IJK5LiOF3rBarOT2myRt0vPM07h/geClbSBf5p5eDGGEKyLcfxuYJzH+1a
 dyaCfkhuptazM388e+FNTulcnpjkg0nh72aVn/+7QESz1GUGaHHKY+5rOuV9FQ6hr9
 cTx/kWT5WNpx41XPkRw2dECiLhwvv5ti9cq/zC3Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.76.170] ([80.245.76.170]) by web-mail.gmx.net
 (3c-app-gmx-bs49.server.lan [172.19.170.102]) (via HTTP); Tue, 23 Nov 2021
 07:52:10 +0100
MIME-Version: 1.0
Message-ID: <trinity-9127d749-a767-4f0c-9502-7916fd39e393-1637650330226@3c-app-gmx-bs49>
From: Frank Wunderlich <frank-w@public-files.de>
To: Xing Song <xing.song@mediatek.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Xing Song <xing.song@mediatek.com>
Subject: Aw: [PATCH] mac80211: set up the fwd_skb->dev for mesh forwarding
Date: Tue, 23 Nov 2021 07:52:10 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20211123033123.2684-1-xing.song@mediatek.com>
References: <20211123033123.2684-1-xing.song@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:/44f5pypWWgTR5lrcbOK89wKkxZF9V9AyJY0cGhbPwSSA+1LO9eY0iZIBMoBcNUxySE/N
 71sk/bhVXLXNXVDLTtrYlkC9fvOjOCHd08eQyix9shM4gB0xp1RyisLgDxCJoatTR1oDHXlpKs2G
 d5gpm0pqHumS9YpTN68WO1Jzd6md9IXj9P6hpqJfl221JkzYYxxtV6oSPGNij1+62xeWrCCET4cV
 d23Zkk5/S5+GdJHizPfZ6MDtXA5p1YTZi9kbhD+76EPnhRAe4uH4w6m+R+0iphsmuvkhvpTejYHU
 ro=
X-UI-Out-Filterresults: notjunk:1;V03:K0:Fy5vRU5rtEg=:ouXey/6r6NLcjSMkEVKBST
 rgnEGV1feE+SzqWsfSE5qAEIcjBNcHZPieS5Uf/dRGzEfoSs+uLjt0nQJUGqe0L16ZinvHSSZ
 jUIrJIwT5QiCOxw3Klacggy6jbrGdvje2rIurpduSKTmCdEE5ZJlwrQNQfk35Ekl4nlzApiFg
 8iVwljHTNeRPNMiO08j5cAMq78dk8+NNpxwbyzsD0OtDuc3iZ1zcMYUxMHBBCr2ls6rd1wqxr
 Zrpf1z+NGOjFPuhXlxWHFkt6A8TNCwvTfRrvoyv0pN173hdnpQ438i3p1T35dmFFB2bRCxD0Q
 0b4kvJ3CZlrCWShiJTiNzDsyFtu5KqxnGHf+XDb3WI4WpVIfWgl3fzZF4oXGDA2NEr5mhdIWj
 UWprMyQcsfYb13u/d3UFnHn24wVpqYuNGEThlrXFOt8EYBqGx/fc8BbHy9l715zDRqNgAfHsy
 +gv+/WhI1tR4cEq5ubFVA/rx3c6YLJt6MiPZrJoxwtL72Mm+rMFKaOT9RdQU9Zw+pvXwtQuMU
 6AU8tJffdmEmE5NUUMMdteLz6oVJ0v+DGHBi/C7rwveTDHaSmRhX4yHtfQx0dBbH/f8b8CLfb
 PVbzYhDUcK8WR3RGpx3p5Nj/s1inNqxJPxC4A2uqDFPzsCoBSJJBVjFXRyZLUvkjlgwf+38J3
 g2yD2oh1qQlMPwb0lGvmlcf+Xd6RUNINDp9oPRHz9gE6hVV3Ou1VvRArao+6qBByswb/Pjs5A
 ro9Qd+kbOvEUWkjzfweZDmLTAoYlSwoJMo9arCJPliNk8evRq2Z+SNNVh5SKZzC7y/wzPIebN
 mJOBFs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_225225_470845_BAAFED93 
X-CRM114-Status: UNSURE (   4.76  )
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

Hi,

Thank you for the Patch, it fixes the issue i've reported here [1]

Tested-By: Frank Wunderlich <frank-w@public-files.de>

regards Frank

[1] https://www.spinics.net/lists/linux-wireless/msg216928.html

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
