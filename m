From: Jing-Ting Wu <jing-ting.wu@mediatek.com>
Subject: [PATCH v2 1/1] sched/rt: avoid contend with CFS task
Date: Mon, 14 Oct 2019 15:09:07 +0800
Message-ID: <1571036948-25034-1-git-send-email-jing-ting.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "Steven Rostedt (VMware)" <rostedt@goodmis.org>, wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Changes since v2:
We have revised the implementation to select a better idle CPU
in the same sched_domain of prev_cpu (with the same cache hotness)
when the RT task wakeup.
