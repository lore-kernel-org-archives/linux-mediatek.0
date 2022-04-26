Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A042CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 00:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6g0BsxbBtHXdE+V5uKm1w1dLDh1gtiVr2JghiRzO2u4=; b=KbR2E/W1VFo2Gr
	YR8TBUTu/dL1Bp9RyB034TDgnpRuVdFIrIeQesaOV+9Ry85zGx1NWWVfK6FniZOL/FWsiLszOaIYd
	IKFzoWV+O/qhlJcLA8Q9yA8M2rPzrSQd2f1000qWwCwpOKM8iUuAXkbSz3OSe2cM0kCmXZ95iYEkd
	6l3igCTI8tr0izCSKs6qRw+nXRforNdsLlrPT/0Y0IQ/wFPpAymISAPxV5A3YbCxFkAhyEaPz0iE9
	Eux1nQGutnPlM1LO9fluOrAGtDSwKQNV5xvh84uvTbZ0MnaHYNXKSCpBOQN0DiRZzli4aQvRK0mBV
	WSfbfQVhTeLIpNK7cK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj8qS-00Bq2g-7j; Tue, 26 Apr 2022 00:14:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj8pY-00BpVq-OK; Tue, 26 Apr 2022 00:13:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 215B2B81A2F;
 Tue, 26 Apr 2022 00:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DAFC385A9;
 Tue, 26 Apr 2022 00:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650932001;
 bh=xLr9N/+WzLJZbvbidRC1oHUW9u+ry45aKTZWakbCfb4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Uh1wvjPAbzRkjQ84Y1vnI73CrhBiQKOxACd8fYeWv2JwYro9PqWhaEWMEh7WQfEeU
 Hyieo1tIBdB/ABAbyNuCAYFKXqOrgT6MSQCFRF7gUdqdXA/kBrjMpvsLfzGI1lhXHj
 lmcDOTJaw99MgY35FtFzowBhOj9Lx//mI4zDmpQo4fJ5zLgRTJG1NtGSDJMD/Xb/Ic
 cGa1NKM+Qq7cN7rXV+qH8KLmDU5K5zk3OHzk1xD1ZRGtg18lcRidZgVqFhPTt4zmE+
 LDmvKFq6zwI4y1Odexl+ds4aszVDVdBoGkE/zR+CXMwVPj5eWPeqS1RtMCeO7xB1oc
 GOyPNhaDGzwDA==
MIME-Version: 1.0
In-Reply-To: <20220409132251.31725-10-chun-jie.chen@mediatek.com>
References: <20220409132251.31725-1-chun-jie.chen@mediatek.com>
 <20220409132251.31725-10-chun-jie.chen@mediatek.com>
Subject: Re: [PATCH v5 09/15] clk: mediatek: Add MT8186 wpesys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 25 Apr 2022 17:13:19 -0700
User-Agent: alot/0.10
Message-Id: <20220426001321.D1DAFC385A9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_171324_975143_88513009 
X-CRM114-Status: UNSURE (   7.45  )
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

Quoting Chun-Jie Chen (2022-04-09 06:22:45)
> Add MT8186 wpesys clock controllers which provide clock gate
> control in Wrapping Engine.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
