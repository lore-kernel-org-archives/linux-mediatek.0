From: John Crispin <john@phrozen.org>
Subject: Re: [PATCH 0/2] clk: mediatek: add missing ethernet reset definition
Date: Fri, 27 Jan 2017 06:00:26 +0100
Message-ID: <6803ef87-fb22-075c-bee1-3c0adb8e297d@phrozen.org>
References: <1485175707-58528-1-git-send-email-john@phrozen.org>
 <20170127001441.GS8801@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170127001441.GS8801@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Michael Turquette <mturquette@baylibre.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Erin Lo <erin.lo@mediatek.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org



On 27/01/2017 01:14, Stephen Boyd wrote:
> On 01/23, John Crispin wrote:
>> When the clk code for mt2701 was merged, we forgot to add the reset
>> controller of the ethernet subsystem. This series adds the missing code
>> and header files required to reference the bits from within a devicetree
>> file.
>>
>> John Crispin (2):
>>   clk: mediatek: add mt2701 ethernet reset
>>   reset: mediatek: Add MT2701 ethsys reset controller include file
>>
>>  drivers/clk/mediatek/clk-mt2701-eth.c     |    2 ++
>>  include/dt-bindings/reset/mt2701-resets.h |    7 +++++++
> 
> Any planned DT users in the next merge window? Should I put this
> into a topic branch? Do you want a clk maintainer ack? At the
> least we need someone like James to ack this first.
> 

Hi Stephen,

the addition of the dtsi snippets for the ethernet core is pending due
to this patch. getting it into v4.11 would be geat so that i can sent
dtsi changes during the next merge window.

	John
